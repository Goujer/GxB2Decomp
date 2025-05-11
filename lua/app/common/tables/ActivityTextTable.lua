-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTextTable.lua

local ActivityTextTable = class("ActivityTextTable", import("app.common.tables.BaseTable"))

function ActivityTextTable:ctor()
	ActivityTextTable.super.ctor(self, "activity_text_" .. string.lower(xyd.lang))
end

function ActivityTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function ActivityTextTable:getTitle(id)
	return self:getString(id, "title")
end

return ActivityTextTable
