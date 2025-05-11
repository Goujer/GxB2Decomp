-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpringFestivalPointTable.lua

local ActivitySpringFestivalPointTable = class("ActivitySpringFestivalPointTable", import("app.common.tables.BaseTable"))

function ActivitySpringFestivalPointTable:ctor()
	ActivitySpringFestivalPointTable.super.ctor(self, "activity_spring_festival_point")
end

function ActivitySpringFestivalPointTable:getPoint(id)
	return self:getNumber(id, "point") or 0
end

function ActivitySpringFestivalPointTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ActivitySpringFestivalPointTable
