-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowWindowTable.lua

local DressShowWindowTable = class("DressShowWindowTable", import(".BaseTable"))

function DressShowWindowTable:ctor()
	DressShowWindowTable.super.ctor(self, "show_window")

	self.ids_ = {}
	self.slotList_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local slot_ids = self:getSlotIDs(id)

		for index, slot_id in ipairs(slot_ids) do
			self.slotList_[slot_id] = {
				index = index,
				show_id = tonumber(id)
			}
		end

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowWindowTable:getIds()
	return self.ids_
end

function DressShowWindowTable:getFunctionID(id)
	return self:getNumber(id, "func_id")
end

function DressShowWindowTable:getSlotIDs(id)
	return self:split2Cost(id, "slot", "|", true)
end

function DressShowWindowTable:getAwardGroup(id)
	return self:getNumber(id, "award_group")
end

function DressShowWindowTable:getShowCaseBySlot(slot_id)
	return self.slotList_[slot_id]
end

return DressShowWindowTable
