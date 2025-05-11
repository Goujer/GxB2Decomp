-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFoodFestivalRewardTable.lua

local ActivityFoodFestivalRewardTable = class("ActivityFoodFestivalRewardTable", import("app.common.tables.BaseTable"))

function ActivityFoodFestivalRewardTable:ctor()
	ActivityFoodFestivalRewardTable.super.ctor(self, "activity_food_festival_awards")
end

function ActivityFoodFestivalRewardTable:getIds()
	local ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(ids, tonumber(id))
	end

	table.sort(ids)

	return ids
end

function ActivityFoodFestivalRewardTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityFoodFestivalRewardTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

function ActivityFoodFestivalRewardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFoodFestivalRewardTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityFoodFestivalRewardTable:getIsNew(id)
	return self:getNumber(id, "is_new") == 1
end

return ActivityFoodFestivalRewardTable
