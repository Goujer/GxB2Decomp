-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHalloweenShopTable.lua

local ActivityHalloweenShopTable = class("ActivityHalloweenShopTable", import("app.common.tables.BaseTable"))

function ActivityHalloweenShopTable:ctor()
	ActivityHalloweenShopTable.super.ctor(self, "activity_trickortreat_shop")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityHalloweenShopTable:getIDs()
	return self.ids
end

function ActivityHalloweenShopTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityHalloweenShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityHalloweenShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityHalloweenShopTable
