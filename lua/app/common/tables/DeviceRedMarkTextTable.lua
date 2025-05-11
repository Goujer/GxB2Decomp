-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DeviceRedMarkTextTable.lua

local DeviceRedMarkTextTable = class("DeviceRedMarkTextTable", import("app.common.tables.BaseTable"))

function DeviceRedMarkTextTable:ctor()
	DeviceRedMarkTextTable.super.ctor(self, "device_red_mark_text_" .. xyd.Global.lang)
end

function DeviceRedMarkTextTable:getPushCategory(id)
	return self:getString(id, "mark_name")
end

return DeviceRedMarkTextTable
