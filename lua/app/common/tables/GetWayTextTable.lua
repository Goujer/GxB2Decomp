-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GetWayTextTable.lua

local GetWayTextTable = class("GetWayTextTable", import("app.common.tables.BaseTable"))

function GetWayTextTable:ctor()
	GetWayTextTable.super.ctor(self, "getway_text_" .. tostring(xyd.Global.lang))
end

function GetWayTextTable:getName(id)
	return self:getString(id, "name")
end

return GetWayTextTable
