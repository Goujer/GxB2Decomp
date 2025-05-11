-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingBuffTextTable.lua

local ActivityOldBuildingBuffTextTable = class("ActivityOldBuildingBuffTextTable", import("app.common.tables.BaseTable"))

function ActivityOldBuildingBuffTextTable:ctor()
	ActivityOldBuildingBuffTextTable.super.ctor(self, "activity_old_building_buff_text_" .. xyd.Global.lang)
end

function ActivityOldBuildingBuffTextTable:getBuffName(id)
	return self:getString(id, "name")
end

function ActivityOldBuildingBuffTextTable:getBuffDesc(id)
	return self:getString(id, "desc")
end

return ActivityOldBuildingBuffTextTable
