-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityShopHeroTable.lua

local ActivityShopHeroTable = class("ActivityShopHeroTable", import("app.common.tables.BaseTable"))

function ActivityShopHeroTable:ctor()
	ActivityShopHeroTable.super.ctor(self, "activity_shop_hero")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityShopHeroTable:getItem(id)
	return self:split2Cost(id, "item", "#")
end

function ActivityShopHeroTable:getIDs()
	return self.ids_
end

function ActivityShopHeroTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

return ActivityShopHeroTable
