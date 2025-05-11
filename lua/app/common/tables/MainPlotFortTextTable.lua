-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotFortTextTable.lua

local MainPlotFortTextTable = class("MainPlotFortTextTable", import("app.common.tables.BaseTable"))

function MainPlotFortTextTable:ctor()
	MainPlotFortTextTable.super.ctor(self, "main_plot_fort_text_" .. string.lower(xyd.lang))
end

function MainPlotFortTextTable:getName(id)
	return self:getString(id, "name")
end

function MainPlotFortTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return MainPlotFortTextTable
