-- chunkname: @../../../Product/Bundles/Android/src/app/windows/BaseWindow.lua

local BaseWindow = class("BaseWindow")
local Destroy = UnityEngine.Object.Destroy
local WindowTable = xyd.tables.windowTable
local Animation = UnityEngine.Animation

function BaseWindow:ctor(name, params)
	self.params_ = params or {}
	self.name_ = name
	self.layerType_ = WindowTable:getLayerType(name)
	self.minDepth_ = 0
	self.resComponents_ = {}
	self.cache_ = xyd.WindowManager.get():getWindowCache(name) or {}
	self.isDisposed_ = false
	self.isWndComplete_ = false
	self.resourcePaths = {}
	self.resItemList = {}
	self.eventProxy_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)
	self.waitForTimeKeys_ = {}
	self.sequence_ = {}
	self.timers_ = {}
	self.tween_count = 0

	local stageHeight = xyd.Global.getRealHeight()
	local num = (stageHeight - 1280) / (xyd.Global.getMaxHeight() - 1280)

	if stageHeight > xyd.Global.getMaxHeight() then
		num = 1
	end

	self.scale_num_ = 1 - num
	self.scale_num_contrary = 1 - self.scale_num_
end

function BaseWindow:willOpen(params)
	local mainWin = xyd.WindowManager.get():getWindow("main_window")

	if mainWin and self.name_ ~= "main_window" then
		local statusNum = xyd.tables.windowTable:bottomBtnStatus(self.name_)

		if statusNum == -2 then
			return
		end

		mainWin:onBottomBtnValueChange(statusNum, true, true)
	end
end

function BaseWindow:addTimeKey(key)
	table.insert(self.waitForTimeKeys_, key)
end

function BaseWindow:getSequence(complete)
	local sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
		if complete then
			complete()
		end
	end)

	self:addSequene(sequence)

	return sequence
end

function BaseWindow:waitForTime(delay, callback, key)
	if not key or key == "" then
		key = xyd.getTimeKey()
	end

	XYDCo.WaitForTime(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)

	return key
end

function BaseWindow:waitForFrame(delay, callback, key)
	if not key or key == "" then
		key = xyd.getTimeKey()
	end

	XYDCo.WaitForFrame(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

function BaseWindow:getTimer(callback, duration, loop)
	local timer = Timer.New(callback, duration, loop)

	table.insert(self.timers_, timer)

	return timer
end

function BaseWindow:getFrameTimer(callback, frame, loop)
	local timer = FrameTimer.New(callback, frame, loop)

	table.insert(self.timers_, timer)

	return timer
end

function BaseWindow:addSequene(sequence)
	table.insert(self.sequence_, sequence)

	self.tween_count = self.tween_count + 1
end

function BaseWindow:addSequeneReturn(sequence)
	table.insert(self.sequence_, sequence)

	self.tween_count = self.tween_count + 1

	return sequence
end

function BaseWindow:delSequene(sequence)
	for i = 1, self.tween_count do
		if self.sequence_[i] == sequence then
			sequence:Kill(false)
			table.remove(self.sequence_, i)
		end
	end
end

function BaseWindow:setResourcePaths(paths)
	for _, path in pairs(paths) do
		if xyd.arrayIndexOf(self.resourcePaths, path) < 0 then
			table.insert(self.resourcePaths, path)
		end
	end
end

function BaseWindow:getloadAsset()
	return self.resourcePaths or {}
end

function BaseWindow:loadAsset(callback)
	local len = #self.resourcePaths

	if len > 0 then
		local needDowloadPaths = {}

		for _, path in pairs(self.resourcePaths) do
			if not ResManager.IsLocalAsset(path) then
				table.insert(needDowloadPaths, path)
			end
		end

		if #needDowloadPaths > 0 then
			for _, path in pairs(needDowloadPaths) do
				-- block empty
			end
		else
			callback()
		end
	else
		callback()
	end
end

function BaseWindow:open(window)
	self.window_ = window

	self:addBackground()
	self:initWindow()

	if xyd.isIosTest() then
		self:iosTestChangeUI()
	end

	self:addTitle()
	self:adjustWindowDepth()
	self:postAddToLayer()
end

function BaseWindow:isTureOpen()
	return self.window_ and not tolua.isnull(self.window_) and self:isWndComplete()
end

function BaseWindow:didOpen()
	local soundIDs = WindowTable:bgsSound(self.name_)

	if next(soundIDs) and soundIDs[1] ~= -1 then
		for k, v in ipairs(soundIDs) do
			xyd.SoundManager.get():playSound(v)
		end
	end
end

function BaseWindow:setSkipOpenAnimation(skipAnimation)
	self.skipOpenAnimation_ = skipAnimation
end

function BaseWindow:playOpenAnimation(callback)
	if tolua.isnull(self.window_) then
		callback()

		return
	end

	self:clearAnimation()

	if tolua.isnull(self.window_) then
		callback()

		return
	end

	local soundID = WindowTable:openSound(self.name_)

	if soundID and soundID ~= "" then
		xyd.SoundManager.get():playSound(soundID)
	end

	local animationType = xyd.tables.windowTable:getOpenAnimation(self.name_)
	local animationPart = xyd.tables.windowTable:getAnimationPart(self.name_)

	if animationType == xyd.WindowAnimationOpenType.NONE or self.skipOpenAnimation_ then
		self:setWndComplete()
		callback()
	else
		self.animationCallback_ = callback

		if animationType == xyd.WindowAnimationOpenType.POPUP2 then
			local go, component

			if animationPart and animationPart ~= "" and self.window_:NodeByName(animationPart) then
				go = self.window_:NodeByName(animationPart).gameObject
				component = go:GetComponent(typeof(UIWidget))
			else
				go = self.window_
				component = go:GetComponent(typeof(UIPanel))
			end

			local originScaleZ = go.transform.localScale.z

			go.transform.localScale = Vector3(0.5, 0.5, originScaleZ)

			local function setter(value)
				component.alpha = value

				if self.params_.playOpenAnimationTweenCal then
					self.params_.playOpenAnimationTweenCal(value)
				end
			end

			local sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
				self:setWndComplete()

				if callback then
					callback()
				end
			end)

			sequence:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 0.5, 1, 0.13):SetEase(DG.Tweening.Ease.Linear))
			sequence:Join(go.transform:DOScale(Vector3(1.1, 1.1, originScaleZ), 0.13):SetEase(DG.Tweening.Ease.Linear))
			sequence:Append(go.transform:DOScale(Vector3(0.97, 0.97, originScaleZ), 0.13):SetEase(DG.Tweening.Ease.Linear))
			sequence:Append(go.transform:DOScale(Vector3(1, 1, originScaleZ), 0.16):SetEase(DG.Tweening.Ease.Linear))
			self:playBgOpenAction(sequence, 0.1)

			self.windowTween_ = sequence
		elseif animationType == xyd.WindowAnimationOpenType.POPUP then
			local go = self.window_
			local originScaleZ = go.transform.localScale.z
			local component

			if animationPart and animationPart ~= "" and self.window_:NodeByName(animationPart) then
				go = self.window_:NodeByName(animationPart).gameObject
				component = go:GetComponent(typeof(UIWidget))
			else
				go = self.window_
				component = go:GetComponent(typeof(UIPanel))
			end

			local function setter(value)
				component.alpha = value

				if self.params_.playOpenAnimationTweenCal then
					self.params_.playOpenAnimationTweenCal(value)
				end
			end

			go.transform.localScale = Vector3(0.5, 0.5, originScaleZ)

			local sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
				self:setWndComplete()

				if callback then
					callback()
				end
			end)

			sequence:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 0.5, 1, 0.1):SetEase(DG.Tweening.Ease.Linear))
			sequence:Join(go.transform:DOScale(Vector3(1.03, 1.03, originScaleZ), 0.1):SetEase(DG.Tweening.Ease.Linear))
			sequence:Append(go.transform:DOScale(Vector3(1, 1, originScaleZ), 0.1):SetEase(DG.Tweening.Ease.Linear))
			self:playBgOpenAction(sequence, 0.1)

			self.windowTween_ = sequence
		elseif animationType == xyd.WindowAnimationOpenType.OVERRIDE then
			if not self.UIAnimation then
				self:setWndComplete()
				callback()

				return
			end

			self:UIAnimation(callback)
		else
			self:setWndComplete()
			callback()
		end
	end
end

function BaseWindow:playBgOpenAction(sequence, t)
	if self.winBg_ then
		local w = self.winBg_:GetComponent(typeof(UIWidget))
		local alpha = w.alpha

		w.alpha = 0

		sequence:Insert(0, xyd.getTweenAlpha(w, alpha, t))
	end
end

function BaseWindow:playBgCloseAction(sequence)
	if self.winBg_ then
		local w = self.winBg_:GetComponent(typeof(UIWidget))

		sequence:Insert(2 * xyd.TweenDeltaTime, xyd.getTweenAlpha(w, 0, 5 * xyd.TweenDeltaTime))
	end
end

function BaseWindow:clearAnimation()
	if self.windowTween_ then
		self.windowTween_:Kill(true)

		self.windowTween_ = nil
	end

	if self.animationList_ then
		for _, action in ipairs(self.animationList_) do
			action:Kill(true)

			action = nil
		end
	end

	self:doAnimationCallback()
end

function BaseWindow:doAnimationCallback()
	if self.animationCallback_ then
		self.animationCallback_()

		self.animationCallback_ = nil
	end
end

function BaseWindow:playCloseAnimation(callback)
	if tolua.isnull(self.window_) then
		callback()

		return
	end

	self:clearAnimation()

	if tolua.isnull(self.window_) then
		callback()

		return
	end

	local animationType = xyd.tables.windowTable:getCloseAnimation(self.name_)
	local animationPart = xyd.tables.windowTable:getAnimationPart(self.name_)

	if animationType == xyd.WindowAnimationCloseType.NONE then
		callback()
	else
		self.animationCallback_ = callback

		if animationType > 0 then
			local go, component

			if animationPart and animationPart ~= "" and self.window_:NodeByName(animationPart) then
				go = self.window_:NodeByName(animationPart).gameObject
				component = go:GetComponent(typeof(UIWidget))
			else
				go = self.window_
				component = go:GetComponent(typeof(UIPanel))
			end

			local function setter(value)
				component.alpha = value

				if self.params_.playOpenAnimationTweenCal then
					self.params_.playOpenAnimationTweenCal(value)
				end
			end

			local originScaleZ = go.transform.localScale.z

			go.transform.localScale = Vector3.one

			local sequence = DG.Tweening.DOTween.Sequence()

			sequence:Append(go.transform:DOScale(Vector3(1.05, 1.05, originScaleZ), 0.06):SetEase(DG.Tweening.Ease.Linear))
			sequence:Append(go.transform:DOScale(Vector3(0.5, 0.5, originScaleZ), 0.14):SetEase(DG.Tweening.Ease.Linear))
			sequence:Join(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 0.5, 0, 0.14):SetEase(DG.Tweening.Ease.Linear))
			sequence:AppendCallback(callback)
			self:playBgCloseAction(sequence)

			self.windowTween_ = sequence
		elseif animationType == xyd.WindowAnimationCloseType.OVERRIDE then
			if not self.UICloseAnimation then
				callback()

				return
			end

			self:UICloseAnimation(callback)
		else
			callback()
		end
	end
end

function BaseWindow:bgAnimation(alpha)
	if self.defaultBg_ == nil or tolua.isnull(self.defaultBg_) then
		return
	end

	local w = self.defaultBg_:GetComponent(typeof(UIWidget))

	if not w then
		return
	end

	local function getter()
		return w.color
	end

	local function setter(value)
		w.color = value
	end

	DG.Tweening.DOTween.ToAlpha(getter, setter, alpha, 2 * xyd.TweenDeltaTime):SetEase(DG.Tweening.Ease.Linear)
end

function BaseWindow:addBackground()
	local bgType = WindowTable:getBackground(self.name_)

	if bgType == nil or bgType == xyd.WindowBgType.NONE then
		return
	end

	local closeTypes = {
		[xyd.WindowBgType.BLACK_60_CLOSE] = true,
		[xyd.WindowBgType.TRANSPARENT_CLOSE] = true,
		[xyd.WindowBgType.BLACK_CLOSE_BTN] = true,
		[xyd.WindowBgType.BLACK_SOLID_CLOSE] = true
	}

	local function setAnchor(script)
		script.height = xyd.Global.maxBgHeight
		script.width = xyd.Global.maxWidth
		script.depth = -1
	end

	local function setDepth(script, d)
		script.depth = d
	end

	local function addCollider(script, bg)
		script.updateAnchors = UIRect.AnchorUpdate.OnStart
		script.autoResizeBoxCollider = true

		bg:AddComponent(typeof(UnityEngine.BoxCollider))
	end

	local function addCommonBg(bg, img, type, color)
		if img == nil then
			img = "guide_mask"
		end

		if type == nil then
			type = UIBasicSprite.Type.Sliced
		end

		local spriteBlack = bg:AddComponent(typeof(UISprite))

		xyd.setUISprite(spriteBlack, "CommonUI", img)

		spriteBlack.type = type

		if color then
			spriteBlack.color = Color.New2(color)
		end

		return spriteBlack
	end

	local bg = self.window_:NodeByName(xyd.WindowDefaultBgName)

	if not bg then
		bg = NGUITools.AddChild(self.window_, xyd.WindowDefaultBgName)
		bg.name = "WINDOWBG"
		self.defaultBg_ = bg

		local script

		if bgType == xyd.WindowBgType.BLACK_60_CLOSE or bgType == xyd.WindowBgType.BLACK_CLOSE_BTN then
			script = addCommonBg(bg, nil, nil, 154)

			addCollider(script, bg)
		elseif bgType == xyd.WindowBgType.BLACK_60_NOT_CLOSE then
			script = addCommonBg(bg, nil, nil, 154)

			addCollider(script, bg)
		elseif bgType == xyd.WindowBgType.TRANSPARENT_CLOSE then
			script = bg:AddComponent(typeof(UIWidget))

			addCollider(script, bg)
		elseif bgType == xyd.WindowBgType.BLACK_SOLID_CLOSE then
			script = addCommonBg(bg, nil, nil, 255)

			addCollider(script, bg)
		elseif bgType == xyd.WindowBgType.BLACK_XXX then
			local alpha = WindowTable:getBackgroundTransparency(self.name_) or 0.6

			script = addCommonBg(bg, nil, nil, 4294967295)

			addCollider(script, bg)

			script:GetComponent(typeof(UIWidget)).alpha = alpha
		elseif bgType == xyd.WindowBgType.TILE then
			-- block empty
		elseif bgType == xyd.WindowBgType.GAUSS_BLUR then
			-- block empty
		elseif bgType == xyd.WindowBgType.BLACK_60 then
			script = bg:AddComponent(typeof(UIWidget))

			addCollider(script, bg)
		end

		if not script then
			__TRACE("Background Type Error: " .. bgType)

			return
		end

		setAnchor(script)

		if closeTypes[bgType] then
			self:setDefaultBgClick(function()
				self:onClickCloseButton()
			end)
		end
	end

	self.winBg_ = bg
end

function BaseWindow:isRuntimeBlurBackground()
	return false
end

function BaseWindow:changeLayer(layerName)
	local layer = LayerMask.NameToLayer(layerName)

	NGUITools.SetLayer(self.window_, layer)
end

function BaseWindow:postAddToLayer()
	if not self:isRuntimeBlurBackground() then
		local layerType = xyd.WindowManager.get():getUILayer(self.layerType_)
		local bluredWindowMaxLayerType = xyd.WindowManager.get():bluredWindowMaxLayerType()

		if bluredWindowMaxLayerType > 0 and bluredWindowMaxLayerType <= layerType then
			self:changeLayer("PostUI")
		end

		return
	end

	self:changeLayer("PostUI")
end

function BaseWindow:showBlurBackground(show_)
	local bg = self.window_:NodeByName(xyd.WindowDefaultBgName)

	if not tolua.isnull(bg) then
		local blurTextureCp = bg:GetComponent(typeof(UITexture))

		xyd.WindowManager.get():showBlurBackground(blurTextureCp, show_)
	end
end

function BaseWindow:close(callback, skipAnimation)
	if skipAnimation == nil then
		skipAnimation = false
	end

	xyd.WindowManager.get():closeWindow(self.name_, callback, skipAnimation)
	self:cleanDefaultBgClick()
end

function BaseWindow:onClickEscBack()
	self:onClickCloseButton()
end

function BaseWindow:closeImmediately()
	xyd.WindowManager.get():closeWindow(self.name_, nil, true)
end

function BaseWindow:setDefaultBgClick(callback)
	if self.defaultBg_ then
		UIEventListener.Get(self.defaultBg_).onClick = callback
	end
end

function BaseWindow:cleanDefaultBgClick()
	if self.defaultBg_ then
		UIEventListener.Get(self.defaultBg_).onClick = nil
	end
end

function BaseWindow:stackType()
	return xyd.tables.windowTable:stackType(self.name_)
end

function BaseWindow:initWindow()
	return
end

function BaseWindow:refresResItems()
	for i = 1, #self.resItemList do
		self.resItemList[i]:refresh()
	end
end

function BaseWindow:register()
	if self.closeBtn then
		UIEventListener.Get(self.closeBtn).onClick = function()
			self:onClickCloseButton()
		end
	end

	if self.helpBtn then
		UIEventListener.Get(self.helpBtn).onClick = function()
			self:onHelpBtnOpen_()
		end
	end

	self.eventProxy_:addEventListener(xyd.event.ITEM_CHANGE, handler(self, self.refresResItems))
end

function BaseWindow:onHelpBtnOpen_()
	local params = {
		key = self:winName() .. "_HELP"
	}

	xyd.WindowManager.get():openWindow("help_window", params)
end

function BaseWindow:update(params)
	self.params_ = params or {}
end

function BaseWindow:updateDisplay(active)
	if active then
		self:moveBack()
	else
		self:moveAway()
	end
end

function BaseWindow:moveAway()
	XYDCo.WaitForEndOfFrame(function()
		if not tolua.isnull(self.window_) then
			self.window_.transform.localPosition = Vector3(-30000, -30000, 0)
		end
	end, nil)
end

function BaseWindow:moveBack()
	XYDCo.WaitForEndOfFrame(function()
		if not tolua.isnull(self.window_) then
			self.window_.transform.localPosition = Vector3.zero
		end
	end, nil)
end

function BaseWindow:getWindowPos()
	return self.window_.transform.localPosition
end

function BaseWindow:getWindowTrans()
	return self.window_.transform
end

function BaseWindow:adjustWindowDepth()
	local layer = xyd.WindowManager.get():getUILayer(self.layerType_)

	if tolua.isnull(self.window_) or tolua.isnull(layer) then
		return
	end

	local minDepth = xyd.LayerType2Depth[self.layerType_]

	assert(minDepth)

	local needDepth = Mathf.Clamp(XYDUtils.GetMaxTargetDepth(layer, false) + 1, minDepth, XYDUtils.MaxInt)

	if self.minDepth_ ~= needDepth then
		XYDUtils.SetTargetMinPanel(self.window_, needDepth)

		self.minDepth_ = needDepth
	end
end

function BaseWindow:beforeClose()
	if self.eventProxy_ then
		self.eventProxy_:removeAllEventListeners()

		self.eventProxy_ = nil
	end

	self:saveCache()

	if next(self.cache_) then
		xyd.WindowManager.get():setWindowCache(self.name_, self.cache_)
	else
		xyd.WindowManager.get():setWindowCache(self.name_, nil)
	end
end

function BaseWindow:willClose()
	self.willClose_ = true
end

function BaseWindow:excuteCallBack(isCloseAll)
	if not isCloseAll and self.params_ and self.params_.closeCallBack then
		self.params_.closeCallBack()
	end
end

function BaseWindow:saveCache()
	return
end

function BaseWindow:getResComponent(componentType)
	return self.resComponents_[componentType]
end

function BaseWindow:dispose()
	if self.isDisposed_ then
		return
	end

	if self.windowTween_ then
		self.windowTween_:Pause()
		self.windowTween_:Kill(true)

		self.windowTween_ = nil
	end

	if self.windowTop then
		self.windowTop:dispose()
	end

	for _, component in pairs(self.resComponents_) do
		component:dispose()
	end

	self.resComponents_ = {}

	if self.tween_count < #self.sequence_ then
		self.tween_count = #self.sequence_
	end

	for i = 1, self.tween_count do
		if self.sequence_[i] and not tolua.isnull(self.sequence_[i]) then
			self.sequence_[i]:Pause()
			self.sequence_[i]:Kill(false)
		end
	end

	self.sequence_ = {}

	if next(self.timers_) then
		for i = 1, #self.timers_ do
			self.timers_[i]:Stop()
		end

		self.timers_ = {}
	end

	local window = self.window_

	self.window_ = nil

	XYDCo.WaitForEndOfFrame(function()
		if not tolua.isnull(window) then
			window:SetActive(false)
			Destroy(window)
		end
	end, nil)

	if next(self.waitForTimeKeys_) then
		for i = 1, #self.waitForTimeKeys_ do
			XYDCo.StopWait(self.waitForTimeKeys_[i])
		end

		self.waitForTimeKeys_ = {}
	end

	self:clearRef()

	self.isDisposed_ = true
end

function BaseWindow:clearRef()
	self.params_ = nil

	for k, v in pairs(self) do
		if type(v) == "userdata" then
			self[k] = nil
		end
	end
end

function BaseWindow:isDisposed()
	return self.isDisposed_
end

function BaseWindow:didClose()
	local soundID = WindowTable:openSound(self.name_)

	if soundID and soundID ~= "" then
		xyd.SoundManager.get():popBg(soundID)
	end

	local soundIDs = WindowTable:bgsSound(self.name_)

	if next(soundIDs) and soundIDs[1] ~= -1 then
		for k, v in ipairs(soundIDs) do
			xyd.SoundManager.get():stopSound(v)
		end
	end
end

function BaseWindow:getName()
	return self.name_
end

function BaseWindow:winName()
	return xyd.tables.windowTable:windowName(self.name_)
end

function BaseWindow:setNext(window)
	self.next_ = window
end

function BaseWindow:setLast(window)
	self.last_ = window
end

function BaseWindow:getNext()
	return self.next_
end

function BaseWindow:getLast()
	return self.last_
end

function BaseWindow:addTitle()
	if self.labelWinTitle then
		self.labelWinTitle.text = __(self:winName())
	end
end

function BaseWindow:updateTitle(titleName, params)
	if not titleName then
		titleName = WindowTable:getTitle(self.name_)

		if not titleName or titleName == "" then
			return
		end
	end

	self.labelTitle_.text = __(titleName)

	local component = WindowTable:getComponent(self.name_)

	self:showResComponent(params and component or xyd.WindowComponentType.CRYSTAL, true, params)
end

function BaseWindow:setTitle(title)
	self.labelTitle_.text = title
end

function BaseWindow:getGuideObject(objName)
	return
end

function BaseWindow:getParams()
	return self.params_
end

function BaseWindow:showResLoading(progress, timeDelay)
	if not xyd.tables.windowTable:isShowResLoading(self.name_) then
		return
	else
		timeDelay = timeDelay or xyd.tables.windowTable:getResLoadingDelay(self.name_)
	end

	local wnd = xyd.WindowManager.get():getWindow("res_loading_window")

	if progress == 1 and not wnd then
		return
	end

	if not wnd then
		wnd = xyd.WindowManager.get():openWindow("res_loading_window", {
			timeDelay = timeDelay
		})

		wnd:setLoadWndName(self.name_)
	end

	if not wnd:isCurLoading(self.name_) then
		return
	end

	wnd:setLoadProgress(self.name_, progress)
end

function BaseWindow:setCloseBtn(btnObj)
	UIEventListener.Get(btnObj).onClick = handler(self, self.onClickCloseButton)
end

function BaseWindow:onClickCloseButton()
	if self.params_ and self.params_.lastWindow and self.name_ ~= "smithy_window" and self.name_ ~= "enhance_window" then
		xyd.WindowManager.get():openWindow(self.params_.lastWindow)
	end

	self:close()
end

function BaseWindow:setWndComplete()
	self.isWndComplete_ = true
end

function BaseWindow:isWndComplete()
	return self.isWndComplete_
end

function BaseWindow:backType()
	return xyd.tables.windowTable:backType(self.name_)
end

function BaseWindow:layerType()
	return xyd.tables.windowTable:getLayerType(self.name_)
end

function BaseWindow:setTimeout(callback, object, microSecond)
	local second = microSecond / 1000

	XYDCo.WaitForTime(second, function()
		if tolua.isnull(self.window_) then
			return
		end

		if callback then
			callback(object)
		end
	end, nil)
end

function BaseWindow:show()
	if self.window_ then
		self.window_:SetActive(true)
	end
end

function BaseWindow:hide()
	if self.window_ then
		self.window_:SetActive(false)
	end
end

function BaseWindow:isShow()
	return self.window_.activeSelf
end

function BaseWindow:hideType()
	return xyd.tables.windowTable:hideType(self.name_)
end

function BaseWindow:dispatchGuideNodeChange()
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.GUIDE_NODE_CHANGE
	})
end

function BaseWindow:iosTestChangeUI()
	return
end

function BaseWindow:canBackClose()
	if xyd.tables.windowTable:backClose(self.name_) ~= 1 then
		return false
	end

	return true
end

function BaseWindow:resizePosY(obj, y_short, y_phoneX)
	obj:Y(y_short + (y_phoneX - y_short) * self.scale_num_contrary)
end

return BaseWindow
