-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityExchangeAwardTable.lua

local ActivityExchangeAwardTable = class("ActivityExchangeAwardTable", import("app.common.tables.BaseTable"))

function ActivityExchangeAwardTable:ctor()
	ActivityExchangeAwardTable.super.ctor(self, "activity_exchange_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityExchangeAwardTable:getIDs()
	return self.ids_
end

function ActivityExchangeAwardTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityExchangeAwardTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

function ActivityExchangeAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

return ActivityExchangeAwardTable
