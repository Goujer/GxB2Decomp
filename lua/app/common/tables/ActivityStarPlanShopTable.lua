-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarPlanShopTable.lua

local ActivityStarPlanShopTable = class("ActivityStarPlanShopTable", import("app.common.tables.BaseTable"))

function ActivityStarPlanShopTable:ctor()
	ActivityStarPlanShopTable.super.ctor(self, "activity_star_plan_shop")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarPlanShopTable:getIDs(id)
	return self.ids_
end

function ActivityStarPlanShopTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityStarPlanShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityStarPlanShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityStarPlanShopTable
