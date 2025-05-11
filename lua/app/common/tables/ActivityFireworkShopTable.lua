-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFireworkShopTable.lua

local ActivityFireworkShopTable = class("ActivityFireworkShopTable", import("app.common.tables.BaseTable"))

function ActivityFireworkShopTable:ctor()
	ActivityFireworkShopTable.super.ctor(self, "activity_firework_shop")

	self.ids_ = {}
	self.ranksAward = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	for i, id in pairs(self.ids_) do
		local rank = self:getShopRank(id)

		if not self.ranksAward[rank] then
			self.ranksAward[rank] = {}
		end

		table.insert(self.ranksAward[rank], tonumber(id))
	end
end

function ActivityFireworkShopTable:getIDs()
	return self.ids_
end

function ActivityFireworkShopTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityFireworkShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityFireworkShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityFireworkShopTable:getShopRank(id)
	return self:getNumber(id, "shop_rank")
end

function ActivityFireworkShopTable:getRanksAward()
	return self.ranksAward
end

return ActivityFireworkShopTable
