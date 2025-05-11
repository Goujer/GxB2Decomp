-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewGrowthPlanTextTable.lua

local ActivityNewGrowthPlanTextTable = class("ActivityNewGrowthPlanTextTable", import("app.common.tables.BaseTable"))

function ActivityNewGrowthPlanTextTable:ctor()
	ActivityNewGrowthPlanTextTable.super.ctor(self, "activity_new_growth_plan_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewGrowthPlanTextTable:getIDs()
	return self.ids_
end

function ActivityNewGrowthPlanTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityNewGrowthPlanTextTable
