-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGamblePlusMissionTable.lua

local ActivityGamblePlusMissionTable = class("ActivityGamblePlusMissionTable", import("app.common.tables.BaseTable"))

function ActivityGamblePlusMissionTable:ctor()
	ActivityGamblePlusMissionTable.super.ctor(self, "activity_gamble_plus_mission")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityGamblePlusMissionTable:getIDs()
	return self.ids_
end

function ActivityGamblePlusMissionTable:getDesc(id)
	return xyd.tables.activityGamblePlusMissionTextTable:getDesc(id)
end

function ActivityGamblePlusMissionTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityGamblePlusMissionTable:getGetway(id)
	return self:getNumber(id, "getway")
end

return ActivityGamblePlusMissionTable
