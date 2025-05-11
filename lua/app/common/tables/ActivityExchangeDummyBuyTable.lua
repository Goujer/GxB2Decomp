-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityExchangeDummyBuyTable.lua

local ActivityExchangeDummyBuyTable = class("ActivityExchangeDummyBuyTable", import("app.common.tables.BaseTable"))

function ActivityExchangeDummyBuyTable:ctor()
	ActivityExchangeDummyBuyTable.super.ctor(self, "activity_doll_buy")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityExchangeDummyBuyTable:getIDs()
	return self.ids
end

function ActivityExchangeDummyBuyTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityExchangeDummyBuyTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityExchangeDummyBuyTable:getAward(id)
	return self:split2num(id, "awards", "#")
end

function ActivityExchangeDummyBuyTable:getIsBatch(id)
	return self:getNumber(id, "is_batch")
end

return ActivityExchangeDummyBuyTable
