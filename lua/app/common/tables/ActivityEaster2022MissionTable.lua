-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEaster2022MissionTable.lua

local ActivityEaster2022MissionTable = class("ActivityEaster2022MissionTable", import("app.common.tables.BaseTable"))

function ActivityEaster2022MissionTable:ctor()
	ActivityEaster2022MissionTable.super.ctor(self, "activity_easter2022_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEaster2022MissionTable:getIDs()
	return self.ids_
end

function ActivityEaster2022MissionTable:getDesc(id)
	return self:getString(id, "desc")
end

function ActivityEaster2022MissionTable:getValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityEaster2022MissionTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityEaster2022MissionTable:getAwrads(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityEaster2022MissionTable:getGetway(id)
	return self:getNumber(id, "getway")
end

return ActivityEaster2022MissionTable
