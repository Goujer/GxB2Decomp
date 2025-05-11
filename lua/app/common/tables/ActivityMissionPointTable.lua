-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMissionPointTable.lua

local ActivityMissionPointTable = class("ActivityMissionPointTable", import("app.common.tables.BaseTable"))

function ActivityMissionPointTable:ctor()
	ActivityMissionPointTable.super.ctor(self, "activity_mission_point")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityMissionPointTable:getIds()
	return self.ids
end

function ActivityMissionPointTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityMissionPointTable:getTotalPoint()
	return self:getPoint(self.ids[#self.ids])
end

function ActivityMissionPointTable:getBaseAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityMissionPointTable:hasEffect1(id)
	return self:split2num(id, "effect", "|")
end

function ActivityMissionPointTable:getExtraAwards(id)
	return self:split2Cost(id, "awards2", "|#")
end

function ActivityMissionPointTable:hasEffect2(id)
	return self:split2num(id, "effect2", "|")
end

return ActivityMissionPointTable
