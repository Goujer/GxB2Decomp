-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPlotListTextTable.lua

local ActivityPlotListTextTable = class("ActivityPlotListTextTable", import("app.common.tables.BaseTable"))

function ActivityPlotListTextTable:ctor()
	ActivityPlotListTextTable.super.ctor(self, "activity_plot_list_text_" .. string.lower(xyd.lang))

	self.ids_ = {}
end

function ActivityPlotListTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityPlotListTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityPlotListTextTable
