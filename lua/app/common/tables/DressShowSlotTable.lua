-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowSlotTable.lua

local DressShowSlotTable = class("DressShowSlotTable", import(".BaseTable"))

function DressShowSlotTable:ctor()
	DressShowSlotTable.super.ctor(self, "show_window_slot")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowSlotTable:getLastId(id)
	return self:getNumber(id, "last_id")
end

function DressShowSlotTable:getType(id)
	return self:getNumber(id, "type")
end

function DressShowSlotTable:getUnlockType(id)
	return self:getNumber(id, "unlock_type")
end

function DressShowSlotTable:getUnlockNum(id)
	return self:getNumber(id, "unlock_num")
end

function DressShowSlotTable:getAddType(id)
	return self:split2num(id, "add_type", "|")
end

function DressShowSlotTable:getAddNum(id)
	return self:split2num(id, "add_num", "|")
end

return DressShowSlotTable
