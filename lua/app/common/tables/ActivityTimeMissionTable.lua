-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTimeMissionTable.lua

local ActivityTimeMissionTable = class("ActivityTimeMissionTable", import("app.common.tables.BaseTable"))

function ActivityTimeMissionTable:ctor()
	ActivityTimeMissionTable.super.ctor(self, "activity_time_mission")
end

function ActivityTimeMissionTable:getTime(id)
	return self:getNumber(id, "time")
end

function ActivityTimeMissionTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityTimeMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityTimeMissionTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityTimeMissionTable:getGetway(id)
	return self:getNumber(id, "getway")
end

return ActivityTimeMissionTable
