-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTravelFrogPlotTextTable.lua

local ActivityTravelFrogPlotTextTable = class("ActivityTravelFrogPlotTextTable", import("app.common.tables.BasePlotTextTable"))

function ActivityTravelFrogPlotTextTable:ctor()
	ActivityTravelFrogPlotTextTable.super.ctor(self, "activity_tour_plot")
end

return ActivityTravelFrogPlotTextTable
