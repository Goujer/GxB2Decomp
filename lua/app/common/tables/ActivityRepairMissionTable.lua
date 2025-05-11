-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRepairMissionTable.lua

local ActivityRepairMissionTable = class("ActivityRepairMissionTable", import("app.common.tables.BaseTable"))

function ActivityRepairMissionTable:ctor()
	ActivityRepairMissionTable.super.ctor(self, "activity_repair_console_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_, function(a, b)
		return a < b
	end)
end

function ActivityRepairMissionTable:getIDs()
	return self.ids_
end

function ActivityRepairMissionTable:getDesc(id)
	return self.getString(id, "desc")
end

function ActivityRepairMissionTable:getComplete(id)
	return self:getNumber(id, "complete_value")
end

function ActivityRepairMissionTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityRepairMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityRepairMissionTable:getJumpWay(id)
	return self:getNumber(id, "getway_id")
end

return ActivityRepairMissionTable
