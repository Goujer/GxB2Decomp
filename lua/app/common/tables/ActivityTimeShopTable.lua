-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTimeShopTable.lua

local ActivityTimeShopTable = class("ActivityTimeShopTable", import(".BaseTable"))

function ActivityTimeShopTable:ctor()
	ActivityTimeShopTable.super.ctor(self, "activity_time_shop")

	self.ids = {}
	self.tabGroupList = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		local tab = self:getTab(id)

		self.tabGroupList[tab] = self.tabGroupList[tab] or {}

		table.insert(self.tabGroupList[tab], tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityTimeShopTable:getIds()
	return self.ids
end

function ActivityTimeShopTable:getListByTab(tab)
	return self.tabGroupList[tab]
end

function ActivityTimeShopTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityTimeShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityTimeShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityTimeShopTable:getTab(id)
	return self:getNumber(id, "tab")
end

function ActivityTimeShopTable:getConditions(id)
	return self:split2Cost(id, "condition_ids", "|")
end

return ActivityTimeShopTable
