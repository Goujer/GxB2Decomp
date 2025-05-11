-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DeviceNotifyTextTable.lua

local DeviceNotifyTextTable = class("DeviceNotifyTextTable", import("app.common.tables.BaseTable"))

function DeviceNotifyTextTable:ctor()
	DeviceNotifyTextTable.super.ctor(self, "device_notify_text_" .. xyd.Global.lang)
end

function DeviceNotifyTextTable:getContent(id)
	return self:getString(id, "contents")
end

function DeviceNotifyTextTable:getTitle(id)
	return self:getString(id, "title")
end

function DeviceNotifyTextTable:getSwitchText(id)
	return self:getString(id, "switch")
end

return DeviceNotifyTextTable
