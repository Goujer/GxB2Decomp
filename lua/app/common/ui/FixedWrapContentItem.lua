-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/FixedWrapContentItem.lua

local FixedWrapContentItem = class("FixedWrapContentItem")

function FixedWrapContentItem:ctor(go, parent)
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

function FixedWrapContentItem:getGameObject()
	return self.go
end

function FixedWrapContentItem:setDragScrollView()
	xyd.setDragScrollView(self.go, self.parent.scrollView)
end

function FixedWrapContentItem:initGO()
	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.onDispose = handler(self, self.dispose)
	end
end

function FixedWrapContentItem:dispose()
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

function FixedWrapContentItem:initUI()
	return
end

function FixedWrapContentItem:registerEvent()
	return
end

function FixedWrapContentItem:update(index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.data = info

	self.go:SetActive(true)
	self:updateInfo()
end

function FixedWrapContentItem:updateInfo()
	return
end

function FixedWrapContentItem:getTimer(callback, duration, loop)
	local timer = Timer.new(callback, duration, loop)

	table.insert(self.timers_, timer)

	return timer
end

function FixedWrapContentItem:getSequence(complete)
	local sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
		if complete then
			complete()
		end
	end)

	table.insert(self.sequences_, sequence)

	return sequence
end

function FixedWrapContentItem:waitForTime(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForTime(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

function FixedWrapContentItem:waitForFrame(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForFrame(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)

	return key
end

return FixedWrapContentItem
