-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJackpotExchangeTable.lua

local ActivityJackpotExchangeTable = class("ActivityJackpotExchangeTable", import("app.common.tables.BaseTable"))

function ActivityJackpotExchangeTable:ctor()
	ActivityJackpotExchangeTable.super.ctor(self, "activity_jackpot_exchange")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ActivityJackpotExchangeTable:getIDs()
	return self.ids_
end

function ActivityJackpotExchangeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityJackpotExchangeTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityJackpotExchangeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityJackpotExchangeTable
