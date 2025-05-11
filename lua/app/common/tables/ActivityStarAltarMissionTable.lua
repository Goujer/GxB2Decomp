-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarAltarMissionTable.lua

local ActivityStarAltarMissionTable = class("ActivityStarAltarMissionTable", import("app.common.tables.BaseTable"))

function ActivityStarAltarMissionTable:ctor()
	ActivityStarAltarMissionTable.super.ctor(self, "activity_star_altar_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarAltarMissionTable:getIDs()
	return self.ids_
end

function ActivityStarAltarMissionTable:getCompValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityStarAltarMissionTable:getActivityID(id)
	return self:getNumber(id, "activity_id")
end

function ActivityStarAltarMissionTable:getGetWay(id)
	return self:getNumber(id, "getway")
end

function ActivityStarAltarMissionTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityStarAltarMissionTable:getAward(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityStarAltarMissionTable:getDesc(id)
	return xyd.tables.activityStarAltarMissionTextTable:getDesc(id)
end

return ActivityStarAltarMissionTable
