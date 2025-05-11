-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFireworkShopRankTable.lua

local ActivityFireworkShopRankTable = class("ActivityFireworkShopRankTable", import("app.common.tables.BaseTable"))

function ActivityFireworkShopRankTable:ctor()
	ActivityFireworkShopRankTable.super.ctor(self, "activity_firework_shop_rank")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFireworkShopRankTable:getIDs()
	return self.ids_
end

function ActivityFireworkShopRankTable:getPoint(id)
	return self:getNumber(id, "point")
end

return ActivityFireworkShopRankTable
