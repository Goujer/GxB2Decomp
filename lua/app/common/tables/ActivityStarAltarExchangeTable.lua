-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarAltarExchangeTable.lua

local ActivityStarAltarExchangeTable = class("ActivityStarAltarExchangeTable", import("app.common.tables.BaseTable"))

function ActivityStarAltarExchangeTable:ctor()
	ActivityStarAltarExchangeTable.super.ctor(self, "activity_star_altar_exchange")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarAltarExchangeTable:getAward(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityStarAltarExchangeTable:getIDs()
	return self.ids_
end

function ActivityStarAltarExchangeTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function ActivityStarAltarExchangeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityStarAltarExchangeTable
