-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarPlanGambleTable.lua

local ActivityStarPlanGambleTable = class("ActivityStarPlanGambleTable", import("app.common.tables.BaseTable"))

function ActivityStarPlanGambleTable:ctor()
	ActivityStarPlanGambleTable.super.ctor(self, "activity_star_plan_gamble")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarPlanGambleTable:getPic(id)
	return self:getString(id, "pic")
end

function ActivityStarPlanGambleTable:getAwards(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityStarPlanGambleTable:getAwardShow(id)
	return self:getNumber(id, "award_show")
end

return ActivityStarPlanGambleTable
