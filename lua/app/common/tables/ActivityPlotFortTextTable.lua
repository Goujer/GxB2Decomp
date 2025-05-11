-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPlotFortTextTable.lua

local ActivityPlotFortTextTable = class("ActivityPlotFortTextTable", import("app.common.tables.BaseTable"))

function ActivityPlotFortTextTable:ctor()
	ActivityPlotFortTextTable.super.ctor(self, "activity_plot_fort_text_" .. string.lower(xyd.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityPlotFortTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityPlotFortTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityPlotFortTextTable
