-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivitySearchBookData.lua

local json = require("cjson")
local ActivityData = import("app.models.ActivityData")
local ActivitySearchBookData = class("ActivitySearchBookData", ActivityData, true)

function ActivitySearchBookData:getUpdateTime()
	if not self.update_time then
		return self:getEndTime()
	end

	return self.update_time + xyd.tables.activityTable:getLastTime(self.activity_id)
end

function ActivitySearchBookData:isOpen()
	if not self:isFunctionOnOpen() then
		return false
	end

	local time1 = xyd.tables.miscTable:getVal("new_trial_restart_open_time")

	if xyd.getServerTime() >= tonumber(time1) then
		return false
	end

	if (self.is_open == 1 or self.is_open == true) and (self.days and self.days < 0 or xyd.getServerTime() < self.end_time) then
		return true
	end

	return false
end

function ActivitySearchBookData:isShow()
	return self:isOpen()
end

return ActivitySearchBookData
