-- chunkname: @../../../Product/Bundles/Android/src/app/maps/MainMap.lua

local MainMap = class("MainMap", import(".BaseMap"))
local Rect = UnityEngine.Rect
local Screen = UnityEngine.Screen
local AddChild = NGUITools.AddChild
local Destroy = UnityEngine.Object.Destroy
local Material = UnityEngine.Material
local GameObject = UnityEngine.GameObject
local SpineManager = xyd.SpineManager
local Camera = UnityEngine.Camera
local PartnerTable = xyd.tables.partnerTable
local DEFAULT_LONG_PRESS_TIME = 0.5
local PartnerImg = import("app.components.PartnerImg")

function MainMap.get()
	if MainMap.INSTANCE == nil then
		MainMap.INSTANCE = MainMap.new()
	end

	return MainMap.INSTANCE
end

function MainMap:clearAll()
	if not MainMap.INSTANCE then
		return
	end

	self:unregisterEvents()
	self:clearUp()

	if self.window_ then
		NGUITools.Destroy(self.window_)

		self.window_ = nil
	end

	MainMap.INSTANCE = nil
end

function MainMap:ctor(...)
	MainMap.super.ctor(self, "MainMap", ...)

	self.mapType_ = xyd.MapType.MAIN
	self.sceneName_ = xyd.SceneName.MAIN
	self.loginEnter_ = true
	self.enterCallback_ = nil
	self.exitCallback_ = nil
	self.scenegui_ = GameObject.FindWithTag("Scenegui")
	self.scenegui_.transform.position = Vector3(0, 1000, 0)
	self.uiRoot_ = self.scenegui_:GetComponent(typeof(UIRoot))
	self.sguiCamera_ = XYDUtils.FindGameObject("SceneUICamera"):GetComponent(typeof(Camera))
	self.isSpine = 0
	self.dialogQueue = {}
end

function MainMap:registerEvents()
	MainMap.super.registerEvents(self)
	self:registerEvent(xyd.event.UPDATE_NEW_BACKGROUND, handler(self, self.onUpdateBackground))
	self:registerEvent(xyd.event.EDIT_PLAYER_PICTURE, handler(self, self.onNewPicture))
end

function MainMap:onUpdateBackground()
	local background = xyd.models.background:getBgID()
	local src = xyd.tables.customBackgroundTable:getPicture(background)

	xyd.setUITextureByNameAsync(self.backTexture, src, false, function()
		return
	end)
end

function MainMap:enterMap(params, callback, enteredCallback)
	__TRACE("enterMap")

	local result = MainMap.super.enterMap(self, params, callback, enteredCallback)

	if result == false then
		return
	end

	if self.loginEnter_ then
		self.loginEnter_ = false

		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.GAME_INITED
		})
	end

	self.callback = callback

	local path = "Prefabs/Windows/main_bg_window"
	local gameObject = ResCache.AddGameObject(self.scenegui_, path)

	self.window_ = gameObject

	local winTrans = gameObject.transform

	self.bgImg = winTrans:Find("bg_img")
	self.partnerImgGroup = winTrans:Find("partner_img_group")
	self.backTexture = winTrans:ComponentByName("bg_img", typeof(UITexture))
	self.bubble = self.partnerImgGroup:NodeByName("bubble").gameObject
	self.christImg1_ = self.bubble:NodeByName("chrisImg1").gameObject
	self.christImg2_ = self.bubble:NodeByName("chrisImg2").gameObject
	self.bubbleY = self.bubble.transform.localPosition.y - 10
	self.bubbleLabel = self.bubble:ComponentByName("bubbleLabel", typeof(UILabel))
	self.btnExchange = self.bubble:NodeByName("btnExchange").gameObject
	self.btnCamera = self.bubble:NodeByName("btnCamera").gameObject
	self.touchField = winTrans:NodeByName("touchField").gameObject

	self.touchField:SetActive(false)

	self.touchChara = self.partnerImgGroup:NodeByName("touchChara").gameObject
	self.snowImgGroup_ = winTrans:NodeByName("snowImgGroup").gameObject
	self.bgEffect_ = winTrans:NodeByName("bgEffect").gameObject
	self.topEffectGroup_ = winTrans:NodeByName("topEffectGroup").gameObject
	self.bottomEffectGroup_ = winTrans:NodeByName("bottomEffectGroup").gameObject

	self.snowImgGroup_:SetActive(false)
	xyd.setBtnLabel(self.btnExchange, {
		text = __("REPLACE")
	})

	UIEventListener.Get(self.btnExchange).onClick = handler(self, self.onReplaceClick)
	UIEventListener.Get(self.btnCamera).onClick = handler(self, function()
		xyd.WindowManager.get():getWindow("main_window").window_:SetActive(false)
		self.snowImgGroup_:SetActive(false)
		self.bubble:SetActive(false)
		self.bgEffect_:SetActive(false)
		self.topEffectGroup_:SetActive(false)
		self.bottomEffectGroup_:SetActive(false)
		self.touchField:SetActive(true)
	end)
	UIEventListener.Get(self.touchField).onClick = handler(self, function()
		xyd.WindowManager.get():getWindow("main_window").window_:SetActive(true)
		self.snowImgGroup_:SetActive(true)
		self.topEffectGroup_:SetActive(true)
		self.bubble:SetActive(true)
		self.bgEffect_:SetActive(true)
		self.bottomEffectGroup_:SetActive(true)
		self.touchField:SetActive(false)
	end)

	local endTime = tonumber(xyd.tables.miscTable:getVal("shengdan_zhujiemian_stop"))

	if not xyd.SHOW_CHRISTMAS or endTime <= xyd.getServerTime() then
		self.christImg1_:SetActive(false)
		self.christImg2_:SetActive(false)
	end

	local panel = gameObject:GetComponent(typeof(UIPanel))

	NGUITools.SetPanelConstrainButDontClip(panel)

	local region = panel.baseClipRegion

	region.z = self:getActiveWidth()
	region.w = self:getActiveHeight()
	panel.baseClipRegion = region

	local background = xyd.models.background:getBgID()
	local src = xyd.tables.customBackgroundTable:getPicture(background)

	if UNITY_IOS or UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.4.8") >= 0 then
		xyd.setUITextureByNameAsync(self.backTexture, "mapBg", false, handler(self, self.initCompelete), true)
	else
		self:initCompelete()
	end

	self.partnerImg = PartnerImg.new(self.partnerImgGroup.gameObject)
	UIEventListener.Get(self.touchChara).onClick = handler(self, function()
		self:ontouchImg()
	end)
	UIEventListener.Get(self.touchChara).onDragStart = function()
		self.delta_ = 0
	end
	UIEventListener.Get(self.touchChara).onDrag = function(go, delta)
		self.delta_ = self.delta_ + delta.x
	end
	UIEventListener.Get(self.touchChara).onDragEnd = function(go)
		self:onDrag()
	end

	self:updateImg()

	if xyd.GuideController.get():isGuideComplete() then
		XYDCo.WaitForTime(1, function()
			self:playDialog(true)
		end, "enter_map_play_dialog")
	end

	self:initChristImg()
end

function MainMap:onNewPicture()
	self:updateImg()
end

function MainMap:initChristImg()
	if xyd.SHOW_CHRISTMAS then
		self.snowImgGroup_:SetActive(true)
		self:showChristmasEffect()
	else
		self.snowImgGroup_:SetActive(false)
		self:hideChristmasEffect()
	end
end

function MainMap:hideChristmasEffect()
	if self.effectChris1_ then
		self.effectChris1_:SetActive(false)
	end

	if self.effectChris3_ then
		self.effectChris3_:SetActive(false)
	end

	if self.effectChris2_ then
		self.effectChris2_:SetActive(false)
	end
end

function MainMap:showChristmasEffect()
	if not self.effectChris1_ then
		self.effectChris1_ = xyd.Spine.new(self.bgEffect_)

		self.effectChris1_:setInfo("zhujiemian_xiaxue", function()
			self.effectChris1_:play("animation", 0, 1)
		end)
	else
		self.effectChris1_:SetActive(true)
		self.effectChris1_:play("animation", 0, 1)
	end

	if not self.effectChris2_ then
		self.effectChris2_ = xyd.Spine.new(self.bottomEffectGroup_)

		self.effectChris2_:setInfo("zhujiemian_down", function()
			self.effectChris2_:SetLocalPosition(0, 575, 0)
			self.effectChris2_:play("animation", 0, 1)
		end)
	else
		self.effectChris2_:SetActive(true)
		self.effectChris2_:play("animation", 0, 1)
	end

	if not self.effectChris3_ then
		self.effectChris3_ = xyd.Spine.new(self.topEffectGroup_)

		self.effectChris3_:setInfo("zhujiemian_top", function()
			self.effectChris3_:SetLocalPosition(0, -650, 0)
			self.effectChris3_:play("animation", 0, 1)
		end)
	else
		self.effectChris3_:SetActive(true)
		self.effectChris3_:play("animation", 0, 1)
	end
end

function MainMap:updateImg()
	local showID = self:getPictureID()

	if showID > 0 and self.partnerImg:getItemID() ~= showID then
		self.isSpine = self.partnerImg:setImg({
			itemID = showID
		}, function()
			local xy = xyd.tables.partnerPictureTable:partnerPictureXy2(showID)
			local scale = xyd.tables.partnerPictureTable:getPartnerPicScale(showID)

			self.partnerImg:SetLocalPosition(xy[1], -xy[2], 0)
			self.partnerImg:SetLocalScale(scale, scale, scale)
			self:clearAction()
			self:partnerMove()
		end)
	else
		self:partnerMove()
	end
end

function MainMap:playModelComeout(callback)
	if xyd.tables.girlsModelTable:getIsSpecail(xyd.tables.partnerPictureTable:getDragonBone(self:getPictureID())) == 1 then
		self.partnerImg:playSpecailComeout(callback)
	else
		callback()
	end
end

function MainMap:ontouchImg()
	if self.isGroupShake then
		return
	end

	self.isGroupShake = true

	self:playDialog()

	if xyd.tables.girlsModelTable:getIsSpecail(xyd.tables.partnerPictureTable:getDragonBone(self:getPictureID())) == 1 then
		self.partnerImg:effectClickFunction()

		self.isGroupShake = false
	else
		if self.gClickSequence then
			self.gClickSequence:Restart()

			return
		end

		local transform = self.partnerImgGroup.transform
		local posY = 0

		self.gClickSequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
			self.isGroupShake = false
		end)

		self.gClickSequence:SetAutoKill(false)
		self.gClickSequence:Append(transform:DOLocalMoveY(posY + 10, 0.1)):Append(transform:DOLocalMoveY(posY - 10, 0.1)):Append(transform:DOLocalMoveY(posY, 0.1))
	end
end

function MainMap:checkSpecailAni()
	if xyd.tables.girlsModelTable:getIsSpecail(xyd.tables.partnerPictureTable:getDragonBone(self:getPictureID())) == 1 then
		self:playDialog()
		self.partnerImg:effectClickFunction()
	end
end

function MainMap:onDrag()
	if self.delta_ > 100 then
		self:partnerSwitch(-1)
	end

	if self.delta_ < -100 then
		self:partnerSwitch(1)
	end
end

function MainMap:partnerSwitch(direction)
	xyd.models.selfPlayer:partnerSwitch(direction)
	self:stopSound()
	self:updateImg()
end

function MainMap:playDialog(isLogin, isIdle, dialogType)
	if not self.bubble then
		return
	end

	if self.isInDailog then
		if not dialogType then
			return
		end

		table.insert(self.dialogQueue, {
			isLogin = isLogin,
			isIdle = isIdle,
			dialogType = dialogType
		})

		return
	end

	self.isInDailog = true

	self.bubble:SetActive(true)

	local pictureID = self:getPictureID()
	local partnerID = pictureID
	local skinID
	local type_ = xyd.tables.itemTable:getType(pictureID)

	if type_ == xyd.ItemType.SKIN then
		skinID = pictureID
		partnerID = xyd.tables.partnerPictureTable:getSkinPartner(pictureID)[1]
	elseif type_ == xyd.ItemType.KANBAN then
		partnerID = xyd.tables.partnerPictureTable:getSkinPartner(pictureID)[1]
	elseif type_ == xyd.ItemType.FAKE_PARTNER_SKIN then
		partnerID = xyd.tables.partnerPictureTable:getSkinPartner(pictureID)[1]
	end

	local clickSoundNum = xyd.tables.partnerTable:getClickSoundNum(partnerID, skinID)
	local index = math.random(1, clickSoundNum)
	local dialogInfo = PartnerTable:getClickDialogInfo(partnerID, index, skinID, xyd.models.slot:getMaxLovePointSuper(partnerID))

	if isLogin then
		dialogInfo = PartnerTable:getLoginDialog(partnerID, skinID)

		local loginText = dialogInfo.dialog

		if loginText then
			self.bubbleLabel.text = loginText
			self.bubble:ComponentByName("bubbleBg", typeof(UISprite)).height = self.bubbleLabel.height + 29
		else
			dump("mainPlayDialog_No-----------------------------------" .. partnerID)
		end

		dialogInfo.time = 3
		self.loginDialogPlayed = true
	else
		if isIdle then
			dialogInfo = PartnerTable:getIdleDialog(partnerID, skinID)
		elseif dialogType then
			if dialogType == 1 then
				dialogInfo = PartnerTable:getTavernDialog(partnerID, skinID)
			elseif dialogType == 2 then
				dialogInfo = PartnerTable:getMissionDialog(partnerID, skinID)
			elseif dialogType == 3 then
				dialogInfo = PartnerTable:getStageDialog(partnerID, skinID)
			elseif dialogType == 4 then
				dialogInfo = PartnerTable:getAlertDialog(partnerID, skinID)
			end

			self:clearDialogQueue()
		end

		if dialogInfo.dialog then
			self.bubbleLabel.text = dialogInfo.dialog
			self.bubble:ComponentByName("bubbleBg", typeof(UISprite)).height = self.bubbleLabel.height + 29
		else
			dump("mainPlayDialog_No-----------------------------------222" .. partnerID)
		end
	end

	if not dialogInfo.time then
		self.bubble:SetActive(false)

		return
	end

	xyd.SoundManager.get():playSound(dialogInfo.sound)

	local key = "bubble_dialog_sound_key"

	XYDCo.WaitForTime(dialogInfo.time + 1, function()
		self.isInDailog = false

		self.bubble:SetActive(false)

		if #self.dialogQueue > 0 then
			local dialog_ = self.dialogQueue[1]

			table.remove(self.dialogQueue, 1)
			self:clearDialogQueue()
			self:playDialog(dialog_.isLogin, dialog_.isIdle, dialog_.dialogType)
		end
	end, key)

	dialogInfo.timeOutId = key
	self.currentDialog = dialogInfo
end

function MainMap:onReplaceClick()
	self:stopSound()
	xyd.openWindow("edit_picture_window", {
		confirmCallback = function()
			if self.isInDailog and self.currentDialog then
				XYDCo.StopWait(self.currentDialog.timeOutId)
			end

			self.isInDailog = false

			self:playDialog()
		end
	})
end

function MainMap:resetPlayDialog()
	self:stopSound()

	if self.isInDailog and self.currentDialog then
		XYDCo.StopWait(self.currentDialog.timeOutId)
	end

	self.isInDailog = false

	self:playDialog()
end

function MainMap:getPictureID()
	self:checkInitPictureID()

	local showID = xyd.models.selfPlayer:getPictureID()

	if not self:checkID(showID) then
		showID = xyd.DEFAULT_PARTNER_PICTURE_ID
	end

	return showID
end

function MainMap:checkID(id)
	local path = xyd.tables.partnerPictureTable:getPartnerPic(id)

	if not path then
		return false
	end

	return true
end

function MainMap:checkInitPictureID()
	local lev = xyd.models.backpack:getLev()

	if lev > 1 or xyd.isH5() then
		return
	end

	local showID = xyd.models.selfPlayer:getPictureID()
	local h5InitIDs = xyd.tables.miscTable:split2num("initial_background_girl", "value", "|")

	if xyd.arrayIndexOf(h5InitIDs, showID) > -1 then
		local uInitID = xyd.tables.miscTable:getNumber("is_unity_initial_background_girl", "value")

		xyd.models.selfPlayer:editPlayerPicture(uInitID)
		xyd.models.selfPlayer:setPictureID(uInitID)
	end
end

function MainMap:getActiveHeight()
	local height = self.uiRoot_.activeHeight

	if height > xyd.Global.maxHeight then
		height = xyd.Global.maxHeight
	end

	return height
end

function MainMap:getActiveWidth()
	local sWidth, sHeight = xyd.getScreenSize()
	local width = self.uiRoot_.activeHeight / sHeight * sWidth

	if width > xyd.Global.maxWidth then
		width = xyd.Global.maxWidth
	end

	return width
end

function MainMap:initCompelete()
	local background = xyd.models.background:getBgID()
	local src = xyd.tables.customBackgroundTable:getPicture(background)

	xyd.setUITextureByNameAsync(self.backTexture, src, false, nil, true)
	XYDCo.WaitForFrame(3, function()
		self:callback()
	end, nil)

	xyd.Global.isMainMapLoaded = true
end

function MainMap:stopSound()
	if self.currentDialog then
		xyd.SoundManager.get():stopSound(self.currentDialog.sound)
		XYDCo.StopWait(self.currentDialog.timeOutId)
		self:clearDialogQueue()
		self.bubble:SetActive(false)

		self.isInDailog = false
	end
end

function MainMap:clearDialogQueue()
	if #self.dialogQueue > 0 then
		local stageTime = 0
		local tavernTime = 0
		local missionTime = 0

		for i = 1, #self.dialogQueue do
			local dialog_ = self.dialogQueue[i]

			if dialog_.dialogType == 1 then
				tavernTime = tavernTime + 1
			elseif dialog_.dialogType == 2 then
				missionTime = missionTime + 1
			elseif dialog_.dialogType == 3 then
				stageTime = stageTime + 1
			end
		end

		xyd.PartnerSoundController.get():setTypeTimes(stageTime, tavernTime, missionTime)
	end

	self.dialogQueue = {}
end

function MainMap:exitMap(params, callback)
	local result = MainMap.super.exitMap(self, params, callback)

	if result == false then
		return
	end

	self:_clearActionEffect()
	self:clearMoveOldStatus()
end

function MainMap:cleanUp()
	self:unregisterEvents()

	self.enterCallback_ = nil

	self.node_:SetActive(false)
	Destroy(self.node_)

	self.node_ = nil

	XYDCo.WaitForFrame(1, function()
		self:callExitCallback()
	end, nil)
end

function MainMap:callExitCallback()
	if self.exitCallback_ then
		self.exitCallback_(self)

		self.exitCallback_ = nil
	end
end

function MainMap:getNode()
	return self.node_
end

function MainMap:onAppPause(event)
	return
end

function MainMap:clearUp()
	self:clearAction()
end

function MainMap:clearAction()
	if self.pMoveSequence then
		self.pMoveSequence:Pause()
		self.pMoveSequence:Kill()

		self.pMoveSequence = nil
	end

	if self.bubbleAction then
		self.bubbleAction:Pause()
		self.bubbleAction:Kill()

		self.bubbleAction = nil
	end
end

function MainMap:partnerMove()
	local id = xyd.models.selfPlayer:getPictureID()

	if xyd.tables.partnerPictureTable:getDragonBone(id) > 0 then
		return
	end

	if not self.pMoveSequence then
		local transform = self.partnerImg:getGameObject().transform
		local posY = transform.localPosition.y - 10

		self.pMoveSequence = DG.Tweening.DOTween.Sequence()

		self.pMoveSequence:SetLoops(-1)
		self.pMoveSequence:Append(transform:DOLocalMoveY(posY - 10, 3)):Append(transform:DOLocalMoveY(posY + 10, 3))
	end

	if not self.bubbleAction then
		local transform = self.bubble.transform

		self.bubbleAction = DG.Tweening.DOTween.Sequence()

		self.bubbleAction:SetLoops(-1)
		self.bubbleAction:Append(transform:DOLocalMoveY(self.bubbleY - 10, 3)):Append(transform:DOLocalMoveY(self.bubbleY + 10, 3))
	end
end

return MainMap
