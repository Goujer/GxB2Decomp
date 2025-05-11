-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseDialogListTable.lua

local HouseDialogListTable = class("HouseDialogListTable", import("app.common.tables.BaseTable"))

function HouseDialogListTable:ctor()
	HouseDialogListTable.super.ctor(self, "house_dialog_list")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function HouseDialogListTable:getIDs()
	return self.ids_
end

function HouseDialogListTable:getGroup(id)
	return self:split2num(id, "group", "|")
end

function HouseDialogListTable:getDialog(id)
	local tmpArry = self:split(id, "dialog", "*")
	local data = {}

	for _, str in ipairs(tmpArry) do
		table.insert(data, xyd.split(str, "|"))
	end

	return data
end

function HouseDialogListTable:getType(id)
	return self:split2num(id, "type", "|")
end

function HouseDialogListTable:getValue(id)
	return self:split2Cost(id, "value", "|#", false)
end

function HouseDialogListTable:needMove(id)
	return self:getNumber(id, "is_move") == 1
end

function HouseDialogListTable:moveEndAction(id)
	return self:split(id, "move_end_action", "|")
end

function HouseDialogListTable:getFlip(id)
	return self:getNumber(id, "flip")
end

return HouseDialogListTable
