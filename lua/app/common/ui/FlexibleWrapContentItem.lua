-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/FlexibleWrapContentItem.lua

local FlexibleWrapContentItem = class("FlexibleWrapContentItem")

function FlexibleWrapContentItem:ctor(go, parent, realIndex)
	self.go = go
	self.parent = parent
	self.realIndex = realIndex
	self.timers_ = {}
	self.sequences_ = {}
	self.waitForTimeKeys_ = {}

	self:initGO()
	self:initUI()
	self:registerEvent()
	self:setDragScrollView()
end

function FlexibleWrapContentItem:getGameObject()
	return self.go
end

function FlexibleWrapContentItem:setDragScrollView()
	xyd.setDragScrollView(self.go, self.parent.scrollView)
end

function FlexibleWrapContentItem:initGO()
	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.onDispose = handler(self, self.dispose)
	end
end

function FlexibleWrapContentItem:dispose()
	if next(self.timers_) then
		for i = 1, #self.timers_ do
			self.timers_[i]:Stop()
		end

		self.timers_ = {}
	end

	if next(self.sequences_) then
		for i = 1, #self.sequences_ do
			if not tolua.isnull(self.sequences_[i]) then
				self.sequences_[i]:Pause()
				self.sequences_[i]:Kill(false)
			end
		end

		self.sequences_ = {}
	end

	if next(self.waitForTimeKeys_) then
		for i = 1, #self.waitForTimeKeys_ do
			XYDCo.StopWait(self.waitForTimeKeys_[i])
		end

		self.waitForTimeKeys_ = {}
	end
end

function FlexibleWrapContentItem:initUI()
	return
end

function FlexibleWrapContentItem:registerEvent()
	return
end

function FlexibleWrapContentItem:refresh()
	return
end

function FlexibleWrapContentItem:getHeight()
	return 10
end

function FlexibleWrapContentItem:getRealIndex()
	return self.realIndex
end

function FlexibleWrapContentItem:setRealIndex(index)
	self.realIndex = index
end

function FlexibleWrapContentItem:fixPos(pos)
	self.go:SetLocalPosition(pos.x, pos.y, pos.z)
end

function FlexibleWrapContentItem:getPos()
	return self.go.transform.localPosition
end

function FlexibleWrapContentItem:getGo()
	return self.go
end

function FlexibleWrapContentItem:getTimer(callback, duration, loop)
	local timer = Timer.new(callback, duration, loop)

	table.insert(self.timers_, timer)

	return timer
end

function FlexibleWrapContentItem:getSequence(complete)
	local sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
		if complete then
			complete()
		end
	end)

	table.insert(self.sequences_, sequence)

	return sequence
end

function FlexibleWrapContentItem:waitForTime(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForTime(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

function FlexibleWrapContentItem:waitForFrame(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForFrame(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)

	return key
end

return FlexibleWrapContentItem
