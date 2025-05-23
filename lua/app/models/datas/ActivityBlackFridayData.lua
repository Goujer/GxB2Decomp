﻿-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivityBlackFridayData.lua

local json = require("cjson")
local ActivityData = import("app.models.ActivityData")
local ActivityBlackFridayData = class("ActivityBlackFridayData", ActivityData, true)

function ActivityBlackFridayData:getUpdateTime()
	if not self.update_time or self.update_time == 0 then
		return self:getEndTime()
	end

	return self.update_time + xyd.tables.activityTable:getLastTime(self.activity_id)
end

function ActivityBlackFridayData:onAward(giftBagID)
	for i = 1, #self.detail_.charges do
		if self.detail_.charges[i].table_id == giftBagID then
			self.detail_.charges[i].buy_times = self.detail_.charges[i].buy_times + 1
		end
	end
end

function ActivityBlackFridayData:getRedMarkState()
	if not self:isFunctionOnOpen() then
		return false
	end

	if self:isFirstRedMark() then
		return true
	end

	local ids = xyd.tables.activityTable:getGiftBag(self.id)

	for i = 1, #ids do
		local id = ids[i]
		local limit = xyd.tables.giftBagTable:getBuyLimit(id)

		if limit > self.detail.charges[i].buy_times then
			return self.defRedMark
		end
	end

	return false
end

return ActivityBlackFridayData
