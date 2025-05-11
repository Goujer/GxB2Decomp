-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSummerPlotTextTable.lua

local ActivityIceSummerPlotTextTable = class("ActivityIceSummerPlotTextTable", import("app.common.tables.BasePlotTextTable"))

function ActivityIceSummerPlotTextTable:ctor()
	ActivityIceSummerPlotTextTable.super.ctor(self, "activity_swimsuit_plot")
end

return ActivityIceSummerPlotTextTable
