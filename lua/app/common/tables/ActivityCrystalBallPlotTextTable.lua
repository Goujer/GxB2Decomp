-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCrystalBallPlotTextTable.lua

local ActivityCrystalBallPlotTextTable = class("ActivityCrystallBallPlotTextTable", import("app.common.tables.BasePlotTextTable"))

function ActivityCrystalBallPlotTextTable:ctor()
	ActivityCrystalBallPlotTextTable.super.ctor(self, "activity_crystal_ball_plot")
end

return ActivityCrystalBallPlotTextTable
