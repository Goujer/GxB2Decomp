-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowWindowSlotAddTextTable.lua

local DressShowWindowSlotAddTextTable = class("DressShowWindowSlotAddTextTable", import("app.common.tables.BaseTable"))

function DressShowWindowSlotAddTextTable:ctor()
	DressShowWindowSlotAddTextTable.super.ctor(self, "show_window_slot_add_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}
	self.idsByType_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local type = self:getAddType(id)

		if not self.idsByType_[type] then
			self.idsByType_[type] = {}
		end

		table.insert(self.idsByType_[type], id)
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowWindowSlotAddTextTable:getIds()
	return self.ids_
end

function DressShowWindowSlotAddTextTable:getAddType(id)
	return self:getNumber(id, "add_type")
end

function DressShowWindowSlotAddTextTable:getAddNum(id)
	return self:getNumber(id, "add_num")
end

function DressShowWindowSlotAddTextTable:getText(add_type, add_num)
	local ids = self.idsByType_[add_type]

	if add_type <= 2 then
		for _, id in ipairs(ids) do
			if self:getAddNum(id) == add_num then
				return self:getString(id, "desc")
			end
		end
	else
		local id = ids[1]
		local text = self:getString(id, "desc")

		return self:translate(text, add_num)
	end
end

function DressShowWindowSlotAddTextTable:translate(text, ...)
	local __args = {
		...
	}
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(text, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return DressShowWindowSlotAddTextTable
