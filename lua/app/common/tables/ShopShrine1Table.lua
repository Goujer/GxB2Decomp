-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopShrine1Table.lua

local ShopShrine1Table = class("ShopShrine1Table", import(".BaseTable"))

function ShopShrine1Table:ctor()
	ShopShrine1Table.super.ctor(self, "shop_shrine1")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ShopShrine1Table:getIds(id)
	return self.ids_
end

function ShopShrine1Table:getItem(id)
	return self:split2num(id, "item", "#")
end

function ShopShrine1Table:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ShopShrine1Table:getBuyTime(id)
	return self:getNumber(id, "buy_time")
end

return ShopShrine1Table
