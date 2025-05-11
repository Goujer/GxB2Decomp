-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity2LoveMissionTable.lua

local Activity2LoveMissionTable = class("Activity2LoveMissionTable", import("app.common.tables.BaseTable"))

function Activity2LoveMissionTable:ctor()
	Activity2LoveMissionTable.super.ctor(self, "activity_2love_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity2LoveMissionTable:getIDs()
	return self.ids_
end

function Activity2LoveMissionTable:getCompleteValue(id)
	return self:getNumber(id, "num")
end

function Activity2LoveMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function Activity2LoveMissionTable:getGetWayID(id)
	return self:getNumber(id, "getway_id")
end

return Activity2LoveMissionTable
