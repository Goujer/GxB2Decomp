-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialPlotTable.lua

local NewTrialPlotTable = class("NewTrialPlotTable", import("app.common.tables.BasePlotTable"))

function NewTrialPlotTable:ctor()
	NewTrialPlotTable.super.ctor(self, "new_trial_plot")
end

function NewTrialPlotTable:getName(id)
	return xyd.tables.newTrialPlotTextTable:getName(id)
end

function NewTrialPlotTable:getDialog(id)
	return xyd.tables.newTrialPlotTextTable:getDialog(id)
end

function NewTrialPlotTable:getSelects(id)
	return xyd.tables.newTrialPlotTextTable:getSelects(id)
end

return NewTrialPlotTable
