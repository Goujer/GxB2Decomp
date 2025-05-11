-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpringFestivalAwardTble.lua

local ActivitySpringFestivalAwardTble = class("ActivitySpringFestivalAwardTble", import("app.common.tables.BaseTable"))

function ActivitySpringFestivalAwardTble:ctor()
	ActivitySpringFestivalAwardTble.super.ctor(self, "activity_spring_festival_award")
end

function ActivitySpringFestivalAwardTble:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivitySpringFestivalAwardTble:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivitySpringFestivalAwardTble:getLimit(id)
	return self:split2Cost(id, "limit", "|", true)
end

return ActivitySpringFestivalAwardTble
