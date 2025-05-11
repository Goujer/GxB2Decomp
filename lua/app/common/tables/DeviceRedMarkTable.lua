-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DeviceRedMarkTable.lua

local BaseTable = import("app.common.tables.BaseTable")
local DeviceRedMarkTable = class("DeviceRedMarkTable", BaseTable)

function DeviceRedMarkTable:ctor()
	BaseTable.ctor(self, "device_red_mark")

	self.ids_ = {}
	self.redMarkTypesArr = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function DeviceRedMarkTable:getIDs()
	return self.ids_
end

function DeviceRedMarkTable:getRedMarkTypes(id)
	if not self.redMarkTypesArr[id] then
		self.redMarkTypesArr[id] = self:split2Cost(id, "red_mark_types", "|", true)
	end

	return xyd.cloneTable(self.redMarkTypesArr[id])
end

return DeviceRedMarkTable
