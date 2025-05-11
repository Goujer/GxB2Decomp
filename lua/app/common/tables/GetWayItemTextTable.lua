-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GetWayItemTextTable.lua

local GetWayItemTextTable = class("GetWayItemTextTable", import("app.common.tables.BaseTable"))

function GetWayItemTextTable:ctor()
	GetWayItemTextTable.super.ctor(self, "getway_item_text_" .. tostring(xyd.Global.lang))
end

function GetWayItemTextTable:getName(id)
	return self:getString(id, "name")
end

return GetWayItemTextTable
