-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLafuliShopTable.lua

local ActivityLafuliShopTable = class("ActivityLafuliShopTable", import("app.common.tables.BaseTable"))

function ActivityLafuliShopTable:ctor()
	ActivityLafuliShopTable.super.ctor(self, "activity_lafuli_shop")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityLafuliShopTable:getIDs()
	return self.ids
end

function ActivityLafuliShopTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityLafuliShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityLafuliShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityLafuliShopTable
