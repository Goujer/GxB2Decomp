-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTuringMissionTable.lua

local ActivityTuringMissionTable = class("ActivityTuringMissionTable", import("app.common.tables.BaseTable"))

function ActivityTuringMissionTable:ctor()
	ActivityTuringMissionTable.super.ctor(self, "activity_turing_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityTuringMissionTable:getIDs()
	return self.ids_
end

function ActivityTuringMissionTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityTuringMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityTuringMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityTuringMissionTable:getGetway(id)
	return self:getNumber(id, "getway")
end

function ActivityTuringMissionTable:getTips(id)
	return self:getNumber(id, "tips")
end

return ActivityTuringMissionTable
