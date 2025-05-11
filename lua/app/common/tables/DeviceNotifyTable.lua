-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DeviceNotifyTable.lua

local DeviceNotifyTable = class("DeviceNotifyTable", import("app.common.tables.BaseTable"))

function DeviceNotifyTable:ctor()
	DeviceNotifyTable.super.ctor(self, "device_notify")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function DeviceNotifyTable:getIds()
	return self.ids_
end

function DeviceNotifyTable:getContent(id)
	return self:getString(id, "contents")
end

function DeviceNotifyTable:getDelayTime(id)
	return self:getNumber(id, "delay_time")
end

function DeviceNotifyTable:getGotoID(id)
	return self:getNumber(id, "go_to_id")
end

return DeviceNotifyTable
