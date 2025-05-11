-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHw2022ShopTable.lua

local ActivityHw2022ShopTable = class("ActivityHw2022ShopTable", import("app.common.tables.BaseTable"))

function ActivityHw2022ShopTable:ctor()
	ActivityHw2022ShopTable.super.ctor(self, "activity_halloween2022_shop")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityHw2022ShopTable:getIDs()
	return self.ids_
end

function ActivityHw2022ShopTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

function ActivityHw2022ShopTable:getAwards(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityHw2022ShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityHw2022ShopTable
