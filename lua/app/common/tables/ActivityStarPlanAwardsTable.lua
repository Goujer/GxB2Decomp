-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarPlanAwardsTable.lua

local ActivityStarPlanAwardsTable = class("ActivityStarPlanAwardsTable", import("app.common.tables.BaseTable"))

function ActivityStarPlanAwardsTable:ctor()
	ActivityStarPlanAwardsTable.super.ctor(self, "activity_star_plan_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarPlanAwardsTable:getIDs(id)
	return self.ids_
end

function ActivityStarPlanAwardsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityStarPlanAwardsTable:getGambleID(id)
	return self:split2Cost(id, "gamble_id", "#")
end

function ActivityStarPlanAwardsTable:getNum(id)
	return self:getNumber(id, "num")
end

return ActivityStarPlanAwardsTable
