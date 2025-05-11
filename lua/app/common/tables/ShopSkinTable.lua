-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopSkinTable.lua

local BaseTable = import("app.common.tables.BaseTable")
local ShopSkinTable = class("ShopSkinTable", BaseTable)

function ShopSkinTable:ctor()
	ShopSkinTable.super.ctor(self, "shop_skin")

	self.ids_ = {}
	self.item_ids_ = {}
	self.cost_ = {}
	self.itemId2ID_ = {}

	local tempIds = {}
	local tempItemIds = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local itemArry = self:item(id)
		local itemID = itemArry[1]

		if itemID ~= nil then
			table.insert(tempItemIds, tonumber(itemID))
			table.insert(tempIds, tonumber(id))

			self.itemId2ID_[itemID] = tonumber(id)
			self.cost_[itemID] = self:cost(id)
		end
	end

	table.sort(self.ids_)

	for idx, id in ipairs(tempIds) do
		self.item_ids_[id] = tempItemIds[idx]
	end

	self.item_ids_ = xyd.tableReverse(self.item_ids_)
end

function ShopSkinTable:getIds()
	return self.ids_
end

function ShopSkinTable:getItemIDs()
	return self.item_ids_
end

function ShopSkinTable:cost(id)
	return self:split2Cost(id, "cost", "#")
end

function ShopSkinTable:costByItemID(item_id)
	return self.cost_[item_id] or {}
end

function ShopSkinTable:idByItemID(item_id)
	return self.itemId2ID_[item_id] or 0
end

function ShopSkinTable:limit(id)
	return self:getNumber(id, "limit")
end

function ShopSkinTable:item(id)
	return self:split2Cost(id, "item", "#")
end

function ShopSkinTable:itemCanBuy(itemID)
	local itemIDs = self:getItemIDs()

	for k, v in pairs(itemIDs) do
		if itemID == v then
			return true
		end
	end

	return false
end

function ShopSkinTable:isShopNew(id)
	return self:getNumber(id, "shop_new") == 1
end

function ShopSkinTable:getShopNew(id)
	return self:getNumber(id, "shop_new") or 0
end

return ShopSkinTable
