-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/TimeCheckController.lua

local TimeCheckController = class("TimeCheckController", import(".BaseController"))

function TimeCheckController.get()
	if not TimeCheckController.INSTANCE then
		TimeCheckController.INSTANCE = TimeCheckController.new()
	end

	return TimeCheckController.INSTANCE
end

function TimeCheckController:ctor()
	self.requestCounters_ = {}
	self.lastRequestTimes_ = {}
	self.lastCurrTimes_ = {}
end

function TimeCheckController:checkTime(key, time, maxTimes)
	local currTime = xyd.getServerTime()
	local lastRequestTime = self.lastRequestTimes_[key]

	if lastRequestTime == time then
		local lastCurrTime = self.lastCurrTimes_[key]

		if lastCurrTime and lastCurrTime == currTime then
			return false, xyd.CheckTimeFalse.SAME_SECOND
		else
			self.lastCurrTimes_[key] = currTime

			local counter = self.requestCounters_[key] or 0

			if counter < (maxTimes or 2) then
				self.requestCounters_[key] = counter + 1

				return true
			else
				return false, xyd.CheckTimeFalse.TRIES_LIMIT
			end
		end
	elseif lastRequestTime and time < lastRequestTime then
		return false, xyd.CheckTimeFalse.ERROR_TIME
	elseif time <= currTime then
		self.lastRequestTimes_[key] = time
		self.requestCounters_[key] = 1
		self.lastCurrTimes_[key] = currTime

		return true
	else
		return false, xyd.CheckTimeFalse.NOT_TIME_UP
	end
end

return TimeCheckController
