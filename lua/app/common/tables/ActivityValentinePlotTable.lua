-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityValentinePlotTable.lua

local ActivityValentinePlotTable = class("ActivityValentinePlotTable", import("app.common.tables.BasePlotTable"))

function ActivityValentinePlotTable:ctor()
	ActivityValentinePlotTable.super.ctor(self, "activity_valentine_plot")
end

function ActivityValentinePlotTable:getSelectNextIDs(id)
	return self:split2Cost(id, "select_next_ids", "|#")
end

function ActivityValentinePlotTable:getSelectLimit(id)
	return self:split2num(id, "select_limit", "|")
end

function ActivityValentinePlotTable:getEndType(id)
	return self:getNumber(id, "end_type") or 0
end

function ActivityValentinePlotTable:getOpenDay(id)
	return self:getNumber(id, "day") or 0
end

function ActivityValentinePlotTable:getBeginID(endId)
	return self:getNumber(endId, "activity_plot_list_id") or 0
end

function ActivityValentinePlotTable:getTitle(id)
	return xyd.tables.activityValentinePlotTextTable:getTitle(id)
end

function ActivityValentinePlotTable:getName(id)
	return xyd.tables.activityValentinePlotTextTable:getName(id)
end

function ActivityValentinePlotTable:getDialog(id)
	return xyd.tables.activityValentinePlotTextTable:getDialog(id)
end

function ActivityValentinePlotTable:getSelects(id)
	return xyd.tables.activityValentinePlotTextTable:getSelects(id)
end

return ActivityValentinePlotTable
