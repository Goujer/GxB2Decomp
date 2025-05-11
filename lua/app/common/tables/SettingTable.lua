-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SettingTable.lua

local SettingTable = class("SettingTable", import("app.common.tables.BaseTable"))

function SettingTable:ctor()
	SettingTable.super.ctor(self, "setting")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local type = row[colIndexTable.type]

		self.ids_[self:Number(type) + 1] = self.ids_[self:Number(type) + 1] or {}

		table.insert(self.ids_[self:Number(type) + 1], id)
	end
end

function SettingTable:getTitle(id)
	return xyd.tables.settingTextTable:getTitle(id)
end

function SettingTable:getType(id)
	return self:getNumber(id, "type")
end

function SettingTable:getText(id)
	return xyd.tables.settingTextTable:getText(id)
end

function SettingTable:getStrIDsbyType(type)
	return self.ids_[type + 1] or {}
end

return SettingTable
