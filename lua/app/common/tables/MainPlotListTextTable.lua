-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotListTextTable.lua

local MainPlotListTextTable = class("MainPlotListTextTable", import("app.common.tables.BaseTable"))

function MainPlotListTextTable:ctor()
	MainPlotListTextTable.super.ctor(self, "main_plot_list_text_" .. string.lower(xyd.lang))
end

function MainPlotListTextTable:getName(id)
	return self:getString(id, "name")
end

function MainPlotListTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return MainPlotListTextTable
