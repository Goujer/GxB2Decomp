-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DeviceNotifyCategoryTable.lua

local DeviceNotifyCategoryTable = class("DeviceNotifyCategoryTable", import("app.common.tables.BaseTable"))

function DeviceNotifyCategoryTable:ctor()
	DeviceNotifyCategoryTable.super.ctor(self, "device_notify_category")
	self:parseTable(nil, true)
end

function DeviceNotifyCategoryTable:getInclude(id)
	return self:split2num(id, "include", "|")
end

function DeviceNotifyCategoryTable:getIDs()
	return self.ids_
end

function DeviceNotifyCategoryTable:getOpenID(id)
	for _, ID in ipairs(self.ids_) do
		if xyd.arrayIndexOf(self:getInclude(ID), id) > 0 then
			return ID
		end
	end

	return 0
end

return DeviceNotifyCategoryTable
