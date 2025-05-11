-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopArenaTable.lua

local ShopArenaTable = class("ShopArenaTable", import("app.common.tables.BaseTable"))

function ShopArenaTable:ctor()
	ShopArenaTable.super.ctor(self, "shop_arena")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end
end

function ShopArenaTable:getIds()
	return self.ids
end

function ShopArenaTable:isShopNew(id)
	return self:getNumber(id, "shop_new") == 1
end

function ShopArenaTable:getShopNew(id)
	return self:getNumber(id, "shop_new") or 0
end

return ShopArenaTable
