-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/FixedMultiWrapContentItem.lua

local FixedMultiWrapContentItem = class("FixedMultiWrapContentItem")

function FixedMultiWrapContentItem:ctor(go, parent)
	self.go = go
	self.parent = parent
	self.timers_ = {}
	self.sequences_ = {}
	self.waitForTimeKeys_ = {}

	self:initGO()
	self:initUI()
	self:registerEvent()
	self:setDragScrollView()
end

function FixedMultiWrapContentItem:setDragScrollView()
	xyd.setDragScrollView(self.go, self.parent.scrollView)
end

function FixedMultiWrapContentItem:initUI()
	return
end

function FixedMultiWrapContentItem:initGO()
	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.onDispose = handler(self, self.dispose)
	end
end

function FixedMultiWrapContentItem:getGameObject()
	return self.go
end

function FixedMultiWrapContentItem:registerEvent()
	return
end

function FixedMultiWrapContentItem:update(wrapIndex, index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.data = info

	self:updateInfo()
end

function FixedMultiWrapContentItem:updateInfo()
	return
end

function FixedMultiWrapContentItem:dispose()
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

function FixedMultiWrapContentItem:getTimer(callback, duration, loop)
	local timer = Timer.new(callback, duration, loop)

	table.insert(self.timers_, timer)

	return timer
end

function FixedMultiWrapContentItem:getSequence(complete)
	local sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
		if complete then
			complete()
		end
	end)

	table.insert(self.sequences_, sequence)

	return sequence
end

function FixedMultiWrapContentItem:waitForTime(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForTime(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

function FixedMultiWrapContentItem:waitForFrame(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForFrame(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

return FixedMultiWrapContentItem
