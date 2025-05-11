-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChildrenShopTable.lua

local ActivityChildrenShopTable = class("ActivityChildrenShopTable", import("app.common.tables.BaseTable"))

function ActivityChildrenShopTable:ctor()
	ActivityChildrenShopTable.super.ctor(self, "activity_children_shop")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityChildrenShopTable:getIDs()
	return self.ids
end

function ActivityChildrenShopTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityChildrenShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityChildrenShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityChildrenShopTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityChildrenShopTable:getLine(id)
	return self:getNumber(id, "line")
end

function ActivityChildrenShopTable:getCondition(id)
	return self:getNumber(id, "condition_id")
end

return ActivityChildrenShopTable
