-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotTextTable.lua

local MainPlotTextTable = class("MainPlotTextTable", import("app.common.tables.BasePlotTextTable"))

function MainPlotTextTable:ctor()
	MainPlotTextTable.super.ctor(self, "main_plot")
end

return MainPlotTextTable
