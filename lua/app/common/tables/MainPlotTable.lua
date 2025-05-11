-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotTable.lua

local MainPlotTable = class("MainPlotTable", import("app.common.tables.BasePlotTable"))

function MainPlotTable:ctor()
	MainPlotTable.super.ctor(self, "main_plot")
end

function MainPlotTable:getName(id)
	return xyd.tables.mainPlotTextTable:getName(id)
end

function MainPlotTable:getDialog(id)
	return xyd.tables.mainPlotTextTable:getDialog(id)
end

function MainPlotTable:getSelects(id)
	return xyd.tables.mainPlotTextTable:getSelects(id)
end

return MainPlotTable
