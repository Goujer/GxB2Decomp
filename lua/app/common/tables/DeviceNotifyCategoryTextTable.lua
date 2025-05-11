-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DeviceNotifyCategoryTextTable.lua

local DeviceNotifyCategoryTextTable = class("DeviceNotifyCategoryTextTable", import("app.common.tables.BaseTable"))

function DeviceNotifyCategoryTextTable:ctor()
	DeviceNotifyCategoryTextTable.super.ctor(self, "device_notify_category_text_" .. xyd.Global.lang)
end

function DeviceNotifyCategoryTextTable:getPushCategory(id)
	return self:getString(id, "push_category")
end

return DeviceNotifyCategoryTextTable
