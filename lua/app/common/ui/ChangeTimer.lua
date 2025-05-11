-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/ChangeTimer.lua

local ChangeTimer = class("ChangeTimer")
local DeltaTime = 0.06

function ChangeTimer:ctor(from, to, fadeOut, fadeIn, pauseTime, callback)
	self.from_ = from
	self.to_ = to
	self.value_ = from
	self.time_ = 0
	self.fadeIn_ = fadeIn
	self.fadeOut_ = fadeOut
	self.pauseTime_ = pauseTime
	self.callback_ = callback
	self.timer_ = Timer.New(handler(self, self.update), DeltaTime, -1, false)
end

function ChangeTimer:start()
	self.timer_:Start()
end

function ChangeTimer:stop()
	self.timer_:Stop()
end

function ChangeTimer:resetToBeginning()
	self.time_ = 0
	self.value_ = self.from_
end

function ChangeTimer:update()
	local oldTime = self.time_
	local time = oldTime + DeltaTime

	if time > self.pauseTime_ then
		local fadeOut = self.fadeOut_
		local fadeIn = self.fadeIn_
		local oldDelta = oldTime - self.pauseTime_
		local delta = time - self.pauseTime_

		if delta < fadeOut then
			self.value_ = Mathf.Lerp(self.from_, self.to_, delta / fadeOut)

			self:doCallback(self.value_, false)
		else
			self.value_ = Mathf.Lerp(self.to_, self.from_, (delta - fadeOut) / fadeIn)

			self:doCallback(self.value_, oldDelta < fadeOut)

			if delta >= fadeOut + fadeIn then
				time = 0
			end
		end
	end

	self.time_ = time
end

function ChangeTimer:doCallback(value, change)
	if self.callback_ then
		self.callback_(value, change)
	end
end

function ChangeTimer:dispose()
	self:stop()

	self.timer_ = nil
	self.callback_ = nil
end

return ChangeTimer
