-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLuckyboxesExchangTable.lua

local ActivityLuckyboxesExchangTable = class("ActivityLuckyboxesExchangTable", import("app.common.tables.BaseTable"))

function ActivityLuckyboxesExchangTable:ctor()
	ActivityLuckyboxesExchangTable.super.ctor(self, "activity_luckyboxes_exchange")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLuckyboxesExchangTable:getIDs()
	return self.ids_
end

function ActivityLuckyboxesExchangTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityLuckyboxesExchangTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityLuckyboxesExchangTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityLuckyboxesExchangTable
