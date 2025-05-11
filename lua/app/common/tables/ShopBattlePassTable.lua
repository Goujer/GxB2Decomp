-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopBattlePassTable.lua

local ShopBattlePassTable = class("ShopBattlePassTable", import("app.common.tables.BaseTable"))

function ShopBattlePassTable:ctor()
	ShopBattlePassTable.super.ctor(self, "shop_battlepass")

	self.ids_ = {}

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ShopBattlePassTable:getType(id)
	return self:getNumber(id, "type")
end

function ShopBattlePassTable:getBuyTimes(id)
	return xyd.tables.shopConfigTable:getSlotBuyTimes(xyd.ShopType.SHOP_BATTLE_PASS, id)
end

function ShopBattlePassTable:getShelf(id)
	return self:getNumber(id, "shelf")
end

return ShopBattlePassTable
