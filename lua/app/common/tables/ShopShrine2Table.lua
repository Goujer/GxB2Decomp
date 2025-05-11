-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopShrine2Table.lua

local ShopShrine2Table = class("ShopShrine2Table", import(".BaseTable"))

function ShopShrine2Table:ctor()
	ShopShrine2Table.super.ctor(self, "shop_shrine2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ShopShrine2Table:getIds(id)
	return self.ids_
end

function ShopShrine2Table:getItem(id)
	return self:split2num(id, "item", "#")
end

function ShopShrine2Table:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ShopShrine2Table:getBuyTime(id)
	return self:getNumber(id, "buy_time")
end

function ShopShrine2Table:getType(id)
	return self:getNumber(id, "type")
end

return ShopShrine2Table
