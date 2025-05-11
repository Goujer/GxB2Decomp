-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDatePlotTextTable.lua

local ActivityDatePlotTextTable = class("ActivityDatePlotTextTable", import("app.common.tables.BasePlotTextTable"))

function ActivityDatePlotTextTable:ctor()
	ActivityDatePlotTextTable.super.ctor(self, "activity_date_plot")
end

return ActivityDatePlotTextTable
