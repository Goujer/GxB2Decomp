-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingBuffTextTable.lua

local OldBuildingBuffTextTable = class("OldBuildingBuffTextTable", import("app.common.tables.BaseTable"))

function OldBuildingBuffTextTable:ctor()
	OldBuildingBuffTextTable.super.ctor(self, "old_building_buff_text_" .. xyd.Global.lang)
end

function OldBuildingBuffTextTable:getBuffName(id)
	return self:getString(id, "name")
end

function OldBuildingBuffTextTable:getBuffDesc(id)
	return self:getString(id, "desc")
end

return OldBuildingBuffTextTable
