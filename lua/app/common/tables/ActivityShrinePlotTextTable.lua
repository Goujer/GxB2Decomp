-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityShrinePlotTextTable.lua

local ActivityShrinePlotTextTable = class("ActivityShrinePlotTextTable", import("app.common.tables.BasePlotTextTable"))

function ActivityShrinePlotTextTable:ctor()
	ActivityShrinePlotTextTable.super.ctor(self, "shrine_plot")
end

return ActivityShrinePlotTextTable
