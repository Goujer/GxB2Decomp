-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopHeroTable.lua

local ShopHeroTable = class("ShopHeroTable", import("app.common.tables.BaseTable"))

function ShopHeroTable:ctor()
	ShopHeroTable.super.ctor(self, "shop_hero")

	self.unchange_id = nil
	self.unchange_num = 0
	self.unchangeItem_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local item = self:getItem(id)

		if self:getIsRefresh(self:Number(id)) <= 0 then
			self.unchangeItem_[item[1]] = true
			self.unchange_num = self.unchange_num + 1
		end
	end
end

function ShopHeroTable:getUnchangeNumber()
	return self.unchange_num
end

function ShopHeroTable:getIsRefresh(id)
	return self:getNumber(id, "is_refresh")
end

function ShopHeroTable:getItem(id)
	return self:split2Cost(id, "item", "#")
end

function ShopHeroTable:checkUnchangeByItemID(item_id)
	return self.unchangeItem_[item_id]
end

return ShopHeroTable
