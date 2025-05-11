-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowWindowShop3Table.lua

local DressShowWindowShop3Table = class("DressShowWindowShop3Table", import(".BaseTable"))

function DressShowWindowShop3Table:ctor()
	DressShowWindowShop3Table.super.ctor(self, "show_window_shop3")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowWindowShop3Table:getIds(id)
	return self.ids_
end

function DressShowWindowShop3Table:getItem(id)
	return self:split2num(id, "item", "#")
end

function DressShowWindowShop3Table:getPoint(id)
	return self:getNumber(id, "point")
end

function DressShowWindowShop3Table:getCost(id)
	return self:split2num(id, "cost", "#")
end

function DressShowWindowShop3Table:getBuyTime(id)
	return self:getNumber(id, "buy_time")
end

return DressShowWindowShop3Table
