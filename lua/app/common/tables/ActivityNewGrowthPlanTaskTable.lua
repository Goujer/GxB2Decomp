-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewGrowthPlanTaskTable.lua

local ActivityNewGrowthPlanTaskTable = class("ActivityNewGrowthPlanTaskTable", import("app.common.tables.BaseTable"))

function ActivityNewGrowthPlanTaskTable:ctor()
	ActivityNewGrowthPlanTaskTable.super.ctor(self, "activity_new_growth_plan_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewGrowthPlanTaskTable:getIDs()
	return self.ids_
end

function ActivityNewGrowthPlanTaskTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityNewGrowthPlanTaskTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityNewGrowthPlanTaskTable:getAwards(id)
	return self:getNumber(id, "awards")
end

function ActivityNewGrowthPlanTaskTable:getActivityId(id)
	return self:getNumber(id, "activity_id")
end

function ActivityNewGrowthPlanTaskTable:getGetway(id)
	return self:getNumber(id, "getway")
end

function ActivityNewGrowthPlanTaskTable:getDesc(id)
	return xyd.tables.activityNewGrowthPlanTextTable:getDesc(id)
end

return ActivityNewGrowthPlanTaskTable
