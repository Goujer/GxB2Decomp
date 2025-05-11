-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseDialogTable.lua

local HouseDialogTable = class("HouseDialogTable", import("app.common.tables.BaseTable"))
local HouseDialogTextTable = xyd.tables.houseDialogTextTable

function HouseDialogTable:ctor()
	HouseDialogTable.super.ctor(self, "house_dialog")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function HouseDialogTable:getIDs()
	return self.ids_
end

function HouseDialogTable:getName(id)
	return HouseDialogTextTable:getName(id)
end

function HouseDialogTable:getDialog(id)
	return HouseDialogTextTable:getDialog(id)
end

function HouseDialogTable:getTime(id)
	return self:getNumber(id, "length")
end

return HouseDialogTable
