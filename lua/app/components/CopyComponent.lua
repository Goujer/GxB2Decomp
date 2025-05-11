-- chunkname: @../../../Product/Bundles/Android/src/app/components/CopyComponent.lua

local CopyComponent = class("CopyComponent")

function CopyComponent:ctor(go)
	self.go = go
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
end

function CopyComponent:getGameObject()
	return self.go
end

function CopyComponent:initUI()
	return
end

function CopyComponent:initGO()
	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.onDispose = handler(self, self.dispose)
	end
end

function CopyComponent:SetActive(visible)
	self.go:SetActive(visible)
end

function CopyComponent:setTouchListener(touchCallback)
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

function CopyComponent:setDragScrollView(scrollView)
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

function CopyComponent:registerEventOuter(eventName, callback)
	return self.eventProxyOuter_:addEventListener(eventName, callback)
end

function CopyComponent:registerEvent(eventName, callback)
	return self.eventProxyInner_:addEventListener(eventName, callback)
end

function CopyComponent:dispose()
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

function CopyComponent:getTimer(callback, duration, loop)
	local timer = Timer.New(callback, duration, loop)

	table.insert(self.timers_, timer)

	return timer
end

function CopyComponent:getSequence(complete, needAutoClean)
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

function CopyComponent:waitForTime(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForTime(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

function CopyComponent:waitForFrame(delay, callback, key)
	if not key or key == "" then
		key = xyd.getTimeKey()
	end

	XYDCo.WaitForFrame(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

function CopyComponent:addParentDepth()
	if not self.go.transform.parent then
		return
	end

	local widget = self.go.transform.parent:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	self:setDepth(widget.depth)
end

function CopyComponent:setDepth(depth)
	if not depth or depth == 0 then
		return
	end

	local function setChildrenDepth(go, depth)
		for i = 1, go.transform.childCount do
			local child = go.transform:GetChild(i - 1).gameObject
			local widget = child:GetComponent(typeof(UIWidget))

			if widget then
				widget.depth = depth + widget.depth
			end

			if child.transform.childCount > 0 then
				setChildrenDepth(child, depth)
			end
		end
	end

	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.depth = widget.depth + depth
	end

	setChildrenDepth(self.go, depth)
end

function CopyComponent:SetLocalPosition(x, y, z)
	self.go:SetLocalPosition(x, y, z)
end

function CopyComponent:SetLocalScale(scaleX, scaleY, scaleZ)
	self.go:SetLocalScale(scaleX, scaleY, scaleZ)
end

function CopyComponent:iosTestChangeUI()
	return
end

return CopyComponent
