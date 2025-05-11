-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGamblePlusTable.lua

local ActivityGamblePlusTable = class("ActivityGamblePlusTable", import("app.common.tables.BaseTable"))

function ActivityGamblePlusTable:ctor()
	ActivityGamblePlusTable.super.ctor(self, "activity_gamble_plus")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityGamblePlusTable:getIDs()
	return self.ids_
end

function ActivityGamblePlusTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityGamblePlusTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityGamblePlusTable:getExtraAwards(id)
	return self:split2Cost(id, "ex_awards", "|#")
end

return ActivityGamblePlusTable
