-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopHeroNewTable.lua

local ShopHeroNewTable = class("ShopHeroNewTable", import("app.common.tables.BaseTable"))

function ShopHeroNewTable:ctor()
	ShopHeroNewTable.super.ctor(self, "shop_hero_new")

	self.ids = {}
	self.item2Ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		self.item2Ids[self:getItemId(id)] = tonumber(id)
	end
end

function ShopHeroNewTable:getIds()
	return self.ids
end

function ShopHeroNewTable:getIdByItemId(itemId)
	return self.item2Ids[itemId]
end

function ShopHeroNewTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ShopHeroNewTable:getItemId(id)
	return self:split2Cost(id, "item", "#")[1]
end

function ShopHeroNewTable:isShopNew(id)
	return self:getNumber(id, "shop_new") == 1
end

function ShopHeroNewTable:getShopNew(id)
	return self:getNumber(id, "shop_new") or 0
end

function ShopHeroNewTable:getGroup(id)
	return self:getNumber(id, "group")
end

return ShopHeroNewTable
