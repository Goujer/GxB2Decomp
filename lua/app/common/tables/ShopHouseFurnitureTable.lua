-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopHouseFurnitureTable.lua

local ShopHouseFurnitureTable = class("ShopHouseFurnitureTable", import("app.common.tables.BaseTable"))

function ShopHouseFurnitureTable:ctor()
	ShopHouseFurnitureTable.super.ctor(self, "shop_house_furniture")

	self.ids_ = {}
	self.item_ids_ = {}
	self.cost_ = {}
	self.limit_ = {}
	self.itemId2ID_ = {}

	local colIndexTable = self.TableLua.keys

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local row = self.TableLua.rows[id]
		local itemArry = xyd.split(row[colIndexTable.item], "#", true)
		local itemID = itemArry[1]

		if itemID then
			table.insert(self.item_ids_, itemID)

			self.itemId2ID_[itemID] = tonumber(id)
			self.cost_[itemID] = xyd.split(row[colIndexTable.cost], "#", true)
			self.limit_[itemID] = tonumber(row[colIndexTable.limit])
		end
	end
end

function ShopHouseFurnitureTable:getIDs()
	return self.ids_
end

function ShopHouseFurnitureTable:getItemIDs()
	return self.item_ids_
end

function ShopHouseFurnitureTable:cost(id)
	return self:split2Cost(id, "cost", "#")
end

function ShopHouseFurnitureTable:costByItemID(item_id)
	return self.cost_[item_id] or {}
end

function ShopHouseFurnitureTable:limitByItemID(item_id)
	return self.limit_[item_id] or 0
end

function ShopHouseFurnitureTable:idByItemID(item_id)
	return self.itemId2ID_[item_id] or 0
end

function ShopHouseFurnitureTable:limit(id)
	return self:getNumber(id, "limit")
end

function ShopHouseFurnitureTable:item(id)
	return self:split2Cost(id, "item", "#")
end

return ShopHouseFurnitureTable
