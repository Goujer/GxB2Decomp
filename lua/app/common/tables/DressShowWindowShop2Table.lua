-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowWindowShop2Table.lua

local DressShowWindowShop2Table = class("DressShowWindowShop2Table", import(".BaseTable"))

function DressShowWindowShop2Table:ctor()
	DressShowWindowShop2Table.super.ctor(self, "show_window_shop2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowWindowShop2Table:getIds(id)
	return self.ids_
end

function DressShowWindowShop2Table:getItem(id)
	return self:split2num(id, "item", "#")
end

function DressShowWindowShop2Table:getPoint(id)
	return self:getNumber(id, "point")
end

function DressShowWindowShop2Table:getCost(id)
	return self:split2num(id, "cost", "#")
end

function DressShowWindowShop2Table:getBuyTime(id)
	return self:getNumber(id, "buy_time")
end

return DressShowWindowShop2Table
