-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDatePlotTable.lua

local ActivityDatePlotTable = class("ActivityDatePlotTable", import("app.common.tables.BasePlotTable"))

function ActivityDatePlotTable:ctor()
	ActivityDatePlotTable.super.ctor(self, "activity_date_plot")
end

function ActivityDatePlotTable:getName(id)
	return xyd.tables.activityDatePlotTextTable:getName(id)
end

function ActivityDatePlotTable:getDialog(id)
	return xyd.tables.activityDatePlotTextTable:getDialog(id)
end

function ActivityDatePlotTable:getSelects(id)
	return xyd.tables.activityDatePlotTextTable:getSelects(id)
end

return ActivityDatePlotTable
