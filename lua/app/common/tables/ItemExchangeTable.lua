-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ItemExchangeTable.lua

local ItemExchangeTable = class("ItemExchangeTable", import("app.common.tables.BaseTable"))

function ItemExchangeTable:ctor()
	ItemExchangeTable.super.ctor(self, "item_exchange")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ItemExchangeTable:getCost(id, isCostNum)
	local str = self:getString(id, "cost")
	local strSplit = xyd.split(str, "#", true)

	if isCostNum == true then
		return strSplit[1]
	elseif isCostNum == false then
		return strSplit[0]
	end

	return strSplit
end

function ItemExchangeTable:getExchangeItem(id, isCostNum)
	local str = self:getString(id, "item")
	local strSplit = xyd.split(str, "#", true)

	if isCostNum == true then
		return strSplit[1]
	elseif isCostNum == false then
		return strSplit[0]
	end

	return strSplit
end

return ItemExchangeTable
