-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChristmasSocksExchangeTable.lua

local ActivityChristmasSocksExchangeTable = class("ActivityChristmasSocksExchangeTable", import("app.common.tables.BaseTable"))

function ActivityChristmasSocksExchangeTable:ctor()
	ActivityChristmasSocksExchangeTable.super.ctor(self, "activity_christmas_socks_change")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityChristmasSocksExchangeTable:getIDs()
	return self.ids_
end

function ActivityChristmasSocksExchangeTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityChristmasSocksExchangeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityChristmasSocksExchangeTable:getCostCard(id)
	return self:split2Cost(id, "cost1", "|#")
end

function ActivityChristmasSocksExchangeTable:getCost(id)
	return self:split2Cost(id, "cost2", "#")
end

function ActivityChristmasSocksExchangeTable:getType(id)
	return self:getNumber(id, "type")
end

return ActivityChristmasSocksExchangeTable
