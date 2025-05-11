-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPiratePlotListTextTable.lua

local ActivityPiratePlotListTextTable = class("ActivityPiratePlotListTextTable", import("app.common.tables.BaseTable"))

function ActivityPiratePlotListTextTable:ctor()
	ActivityPiratePlotListTextTable.super.ctor(self, "activity_pirate_plot_list_text_" .. tostring(xyd.Global.lang))
end

function ActivityPiratePlotListTextTable:getTitle(id)
	return self:getString(id, "title")
end

function ActivityPiratePlotListTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityPiratePlotListTextTable
