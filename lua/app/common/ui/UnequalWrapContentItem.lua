-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/UnequalWrapContentItem.lua

local UnequalWrapContentItem = class("UnequalWrapContentItem")

function UnequalWrapContentItem:ctor(go, parent, realIndex)
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

function UnequalWrapContentItem:getGameObject()
	return self.go
end

function UnequalWrapContentItem:setDragScrollView()
	xyd.setDragScrollView(self.go, self.parent.scrollView)
end

function UnequalWrapContentItem:initGO()
	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		widget.onDispose = handler(self, self.dispose)
	end
end

function UnequalWrapContentItem:dispose()
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

function UnequalWrapContentItem:initUI()
	return
end

function UnequalWrapContentItem:registerEvent()
	return
end

function UnequalWrapContentItem:update(index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.data = info

	self.go:SetActive(true)
	self:updateInfo()

	self.go:ComponentByName("", typeof(UIWidget)).height = self:getHeight()
end

function UnequalWrapContentItem:updateInfo()
	return
end

function UnequalWrapContentItem:getHeight()
	return 10
end

function UnequalWrapContentItem:getRealIndex()
	return self.realIndex
end

function UnequalWrapContentItem:setRealIndex(index)
	self.realIndex = index
end

function UnequalWrapContentItem:fixPos(pos)
	self.go:SetLocalPosition(pos.x, pos.y, pos.z)
end

function UnequalWrapContentItem:getPos()
	return self.go.transform.localPosition
end

function UnequalWrapContentItem:getGo()
	return self.go
end

function UnequalWrapContentItem:getTimer(callback, duration, loop)
	local timer = Timer.new(callback, duration, loop)

	table.insert(self.timers_, timer)

	return timer
end

function UnequalWrapContentItem:getSequence(complete)
	local sequence = DG.Tweening.DOTween.Sequence():OnComplete(function()
		if complete then
			complete()
		end
	end)

	table.insert(self.sequences_, sequence)

	return sequence
end

function UnequalWrapContentItem:waitForTime(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForTime(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)
end

function UnequalWrapContentItem:waitForFrame(delay, callback, key)
	key = key or xyd.getTimeKey()

	XYDCo.WaitForFrame(delay, callback, key)
	table.insert(self.waitForTimeKeys_, key)

	return key
end

return UnequalWrapContentItem
