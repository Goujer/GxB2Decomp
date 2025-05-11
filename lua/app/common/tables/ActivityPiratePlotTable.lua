-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPiratePlotTable.lua

local ActivityPiratePlotTable = class("ActivityPiratePlotTable", import("app.common.tables.BasePlotTable"))

function ActivityPiratePlotTable:ctor()
	ActivityPiratePlotTable.super.ctor(self, "activity_pirate_plot")
end

function ActivityPiratePlotTable:getName(id)
	return xyd.tables.activityPiratePlotTextTable:getName(id)
end

function ActivityPiratePlotTable:getDialog(id)
	return xyd.tables.activityPiratePlotTextTable:getDialog(id)
end

function ActivityPiratePlotTable:getSelects(id)
	return xyd.tables.activityPiratePlotTextTable:getSelects(id)
end

return ActivityPiratePlotTable
