-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarAltarCostTable.lua

local ActivityStarAltarCostTable = class("ActivityStarAltarCostTable", import("app.common.tables.BaseTable"))

function ActivityStarAltarCostTable:ctor()
	ActivityStarAltarCostTable.super.ctor(self, "activity_star_altar_cost")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarAltarCostTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityStarAltarCostTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityStarAltarCostTable:getIDs()
	return self.ids_
end

return ActivityStarAltarCostTable
