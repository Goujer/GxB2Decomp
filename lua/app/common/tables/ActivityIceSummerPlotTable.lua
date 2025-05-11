-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSummerPlotTable.lua

local ActivityIceSummerPlotTable = class("ActivityIceSummerPlotTable", import("app.common.tables.BasePlotTable"))

function ActivityIceSummerPlotTable:ctor()
	ActivityIceSummerPlotTable.super.ctor(self, "activity_swimsuit_plot")
end

function ActivityIceSummerPlotTable:getName(id)
	return xyd.tables.activityIceSummerPlotTextTable:getName(id)
end

function ActivityIceSummerPlotTable:getDialog(id)
	return xyd.tables.activityIceSummerPlotTextTable:getDialog(id)
end

function ActivityIceSummerPlotTable:getSelects(id)
	return xyd.tables.activityIceSummerPlotTextTable:getSelects(id)
end

return ActivityIceSummerPlotTable
