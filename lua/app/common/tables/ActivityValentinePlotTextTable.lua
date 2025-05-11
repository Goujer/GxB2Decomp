-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityValentinePlotTextTable.lua

local ActivityValentinePlotTextTable = class("ActivityValentinePlotTextTable", import("app.common.tables.BasePlotTextTable"))

function ActivityValentinePlotTextTable:ctor()
	ActivityValentinePlotTextTable.super.ctor(self, "activity_valentine_plot")
end

return ActivityValentinePlotTextTable
