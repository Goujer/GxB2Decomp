-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRedRidingHoodTable.lua

local ActivityRedRidingHoodTable = class("ActivityRedRidingHoodTable", import("app.common.tables.BaseTable"))

function ActivityRedRidingHoodTable:ctor()
	ActivityRedRidingHoodTable.super.ctor(self, "activity_red_riding_hood")
end

function ActivityRedRidingHoodTable:getAwards(id)
	return self:split2Cost(id, "daily_awards", "|#")
end

function ActivityRedRidingHoodTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityRedRidingHoodTable:getBuyLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityRedRidingHoodTable
