-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJungleShopTable.lua

local BaseTable = import(".BaseTable")
local ActivityJungleShopTable = class("ActivityJungleShopTable", BaseTable)

function ActivityJungleShopTable:ctor()
	BaseTable.ctor(self, "activity_jungle_shop")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityJungleShopTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityJungleShopTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

function ActivityJungleShopTable:getIDs()
	return self.ids_
end

function ActivityJungleShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityJungleShopTable
