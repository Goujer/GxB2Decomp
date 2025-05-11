-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialPlotTextTable.lua

local NewTrialPlotTextTable = class("NewTrialPlotTextTable", import("app.common.tables.BasePlotTextTable"))

function NewTrialPlotTextTable:ctor()
	NewTrialPlotTextTable.super.ctor(self, "new_trial_plot")
end

return NewTrialPlotTextTable
