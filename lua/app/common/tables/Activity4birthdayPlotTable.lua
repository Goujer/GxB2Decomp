-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4birthdayPlotTable.lua

local Activity4birthdayPlotTable = class("Activity4birthdayPlotTable", import("app.common.tables.BasePlotTable"))

function Activity4birthdayPlotTable:ctor()
	Activity4birthdayPlotTable.super.ctor(self, "activity_4birthday_plot")
end

function Activity4birthdayPlotTable:getName(id)
	return xyd.tables.activity4birthdayPlotTextTable:getName(id)
end

function Activity4birthdayPlotTable:getDialog(id)
	return xyd.tables.activity4birthdayPlotTextTable:getDialog(id)
end

function Activity4birthdayPlotTable:getSelects(id)
	return xyd.tables.activity4birthdayPlotTextTable:getSelects(id)
end

return Activity4birthdayPlotTable
