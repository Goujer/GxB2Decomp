-- chunkname: @../../../Product/Bundles/Android/src/app/components/BaseComponent.lua

local BaseComponent = class("BaseComponent")

function BaseComponent:ctor(parentGo)
	self.parentGo = parentGo
	self.timers_ = {}
	self.sequences_ = {}
	self.waitForTimeKeys_ = {}
	self.tween_count = 0
	self.eventProxyInner_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)
	self.eventProxyOuter_ = xyd.EventProxy.new(xyd.EventDispatcher.outer(), self)

	self:initGO()
	self:initUI()

	if xyd.isIosTest() then
		self:iosTestChangeUI()
	end

	self:setDepth(self.offsetDepth)
	self:onRegister()
end

function BaseComponent:getPrefabPath()
	return
end

function BaseComponent:initGO()
	self.go = ResCache.AddGameObject(self.parentGo, self:getPrefabPath())

	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.onDispose = handler(self, self.dispose)
	end
end

function BaseComponent:initUI()
	local widgetNode = self.parentGo:GetComponent(typeof(UIWidget))

	if not widgetNode then
		__TRACE("Parent game object must hava UIWidget Component")

		return
	end

	self.parentWidget = widgetNode

	if not self.offsetDepth then
		self.offsetDepth = widgetNode.depth
	end
end

function BaseComponent:setDepth(depth)
	if not depth or depth == 0 then
		return
	end

	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.depth = widget.depth + depth
	end

	self:setChildrenDepth(self.go, depth)
end

function BaseComponent:setChildrenDepth(go, depth)
	for i = 1, go.transform.childCount do
		local child = go.transform:GetChild(i - 1).gameObject
		local widget = child:GetComponent(typeof(UIWidget))

		if widget then
			widget.depth = depth + widget.depth
		end

		if child.transform.childCount > 0 then
			self:setChildrenDepth(child, depth)
		end
	end
end

function BaseComponent:updateDepthObj(depth)
	local maxDepath = depth

	if self.depthObjs_ and next(self.depthObjs_) then
		for i = 1, #self.depthObjs_ do
			self.depthObjs_[i].depth = i + depth
		end

		maxDepath = maxDepath + #self.depthObjs_
	end

	return maxDepath
end

function BaseComponent:setPanelDepth()
	local panel = self.go:GetComponentInParent(typeof(UIPanel))

	if not panel then
		return
	end

	local depth = panel.depth
	local cPanels = self.go:GetComponentsInChildren(typeof(UIPanel), true)

	if not cPanels or cPanels.Length <= 0 then
		return
	end

	for i = 0, cPanels.Length - 1 do
		local cPanel = cPanels[i]

		cPanel.depth = cPanel.depth + depth
	end
end

function BaseComponent:changeParent(newParentGo)
	ResCache.AddChild(newParentGo, self.go)

	self.parentGo = newParentGo
end

function BaseComponent:getParentDepth()
	local widgetNode = self.parentGo:GetComponent(typeof(UIWidget))

	if not widgetNode then
		return 0
	end

	return widgetNode.depth
end

function BaseComponent:getGameObject()
	return self.go
end

function BaseComponent:SetActive(visible)
	self.go:SetActive(visible)
end

function BaseComponent:setTouchListener(touchCallback)
	local widget = self.go:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	if not self.go:GetComponent(typeof(UnityEngine.BoxCollider)) then
		local boxCollider = self.go:AddComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(widget.width, widget.height, 0)
	end

	UIEventListener.Get(self.go).onClick = touchCallback
end

function BaseComponent:setPressListener(touchCallback)
	local widget = self.go:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	if not self.go:GetComponent(typeof(UnityEngine.BoxCollider)) then
		local boxCollider = self.go:AddComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(widget.width, widget.height, 0)
	end

	UIEventListener.Get(self.go).onPress = touchCallback
end

function BaseComponent:setTouchDragListener(startCallback, dragCallback, endCallback)
	local widget = self.go:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	if not self.go:GetComponent(typeof(UnityEngine.BoxCollider)) then
		local boxCollider = self.go:AddComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(widget.width, widget.height, 0)
	end

	UIEventListener.Get(self.go).onDragStart = function(go)
		startCallback(self)
	end
	UIEventListener.Get(self.go).onDrag = function(go, delta)
		dragCallback(self, delta)
	end
	UIEventListener.Get(self.go).onDragEnd = function(go)
		endCallback(self)
	end
end

function BaseComponent:setLongPressListener(callback)
	local widget = self.go:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	if not self.go:GetComponent(typeof(UnityEngine.BoxCollider)) then
		local boxCollider = self.go:AddComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(widget.width, widget.height, 0)
	end

	UIEventListener.Get(self.go).onLongPress = function(go)
		callback(self)
	end
end

function BaseComponent:setDragScrollView(scrollView)
	local widget = self.go:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	if not self.go:GetComponent(typeof(UnityEngine.BoxCollider)) then
		local boxCollider = self.go:AddComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(widget.width, widget.height, 0)
	end

	local dragScrollView = self.go:GetComponent(typeof(UIDragScrollView))

	dragScrollView = dragScrollView or self.go:AddComponent(typeof(UIDragScrollView))
	dragScrollView.scrollView = scrollView
end

function BaseComponent:onRegister()
	return
end

function BaseComponent:registerEventOuter(eventName, callback)
	return self.eventProxyOuter_:addEventListener(eventName, callback)
end

function BaseComponent:registerEvent(eventName, callback)
	return self.eventProxyInner_:addEventListener(eventName, callback)
end

function BaseComponent:setScaleAsParent()
	local x = self.parentWidget.width / self.go:GetComponent(typeof(UIWidget)).width
	local y = self.parentWidget.height / self.go:GetComponent(typeof(UIWidget)).height

	self.go:SetLocalScale(x, y, 1)
end

function BaseComponent:SetLocalPosition(x, y, z)
	self.go:SetLocalPosition(x, y, z)
end

function BaseComponent:SetLocalScale(scaleX, scaleY, scaleZ)
	self.go:SetLocalScale(scaleX, scaleY, scaleZ)
end

function BaseComponent:setAlha(val)
	local widget = self.go:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	widget.alpha = val
end

function BaseComponent:dispose()
	self.isDispose_ = true

	if self.eventProxyOuter_ then
		self.eventProxyOuter_:removeAllEventListeners()

		self.eventProxyOuter_ = nil
	end

	if self.eventProxyInner_ then
		self.eventProxyInner_:removeAllEventListeners()

		self.eventProxyInner_ = nil
	end

	if next(self.timers_) then
		for i = 1, #self.timers_ do
			self.timers_[i]:Stop()
		end

		self.timers_ = {}
	end

	if self.tween_count < #self.sequences_ then
		self.tween_count = #self.sequences_
	end

	for i = 1, self.tween_count do
		if self.sequences_[i] and not tolua.isnull(self.sequences_[i]) then
			self.sequences_[i]:Pause()
			self.sequences_[i]:Kill(false)
		end
	end

	self.sequences_ = {}

	if next(self.waitForTimeKeys_) then
		for i = 1, #self.waitForTimeKeys_ do
			XYDCo.StopWait(self.waitForTimeKeys_[i])
		end

		self.waitForTimeKeys_ = {}
	end
end

function BaseComponent:getTimer(callback, duration, loop)
	local timer = Timer.New(callback, duration, loop)

	table.insert(self.timers_, timer)

	return timer
end

function BaseComponent:getSequence(complete, needAutoClean)
	local sequence

	sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
		if complete then
			complete()
		end

		if needAutoClean then
			local index = xyd.arrayIndexOf(self.sequences_, sequence)

			if index >= 1 then
				self.sequences_[index]:Pause()
				self.sequences_[index]:Kill(false)
			end

			table.remove(self.sequences_, index)
		end
	end)
	self.tween_count = self.tween_count + 1

	table.insert(self.sequences_, sequence)

	return sequence
end

function BaseComponent:waitForTime(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForTime(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)

	return key
end

function BaseComponent:waitForFrame(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForFrame(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)

	return key
end

function BaseComponent:iosTestChangeUI()
	return
end

return BaseComponent
