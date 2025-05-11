-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCrystalBallPlotTable.lua

local ActivityCrystalBallPlotTable = class("ActivityCrystallBallPlotTable", import("app.common.tables.StoryTable"))
local BasePlotTable = class("BasePlotTable", import("app.common.tables.BaseTable"))

function ActivityCrystalBallPlotTable:ctor()
	BasePlotTable.super.ctor(self, "activity_crystal_ball_plot")
end

function ActivityCrystalBallPlotTable:getName(id)
	return xyd.tables.activityCrystalBallPlotTextTable:getName(id)
end

function ActivityCrystalBallPlotTable:getDialog(id)
	return xyd.tables.activityCrystalBallPlotTextTable:getDialog(id)
end

function ActivityCrystalBallPlotTable:getSelects(id)
	return xyd.tables.activityCrystalBallPlotTextTable:getSelects(id)
end

return ActivityCrystalBallPlotTable
