-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopBattlePass2Table.lua

local ShopBattlePass2Table = class("BattlePass2Table", import(".ShopBattlePassTable"))
local BaseTable = import(".BaseTable")

function ShopBattlePass2Table:ctor()
	BaseTable.ctor(self, "shop_battlepass_2")

	self.ids_ = {}

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ShopBattlePass2Table:getBuyTimes(id)
	return xyd.tables.shopConfigTable:getSlotBuyTimes(xyd.ShopType.SHOP_BATTLE_PASS_2, id)
end

return ShopBattlePass2Table
