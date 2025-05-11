-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTravelFrogPlotTable.lua

local ActivityTravelFrogPlotTable = class("ActivityTravelFrogPlotTable", import("app.common.tables.BasePlotTable"))

function ActivityTravelFrogPlotTable:ctor()
	ActivityTravelFrogPlotTable.super.ctor(self, "activity_tour_plot")
end

function ActivityTravelFrogPlotTable:getName(id)
	return xyd.tables.activityTravelFrogPlotTextTable:getName(id)
end

function ActivityTravelFrogPlotTable:getDialog(id)
	return xyd.tables.activityTravelFrogPlotTextTable:getDialog(id)
end

function ActivityTravelFrogPlotTable:getSelects(id)
	return xyd.tables.activityTravelFrogPlotTextTable:getSelects(id)
end

return ActivityTravelFrogPlotTable
