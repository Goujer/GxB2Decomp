-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFireworkRankAwardTable.lua

local ActivityFireworkRankAwardTable = class("ActivityFireworkRankAwardTable", import("app.common.tables.BaseTable"))

function ActivityFireworkRankAwardTable:ctor()
	ActivityFireworkRankAwardTable.super.ctor(self, "activity_firework_rank_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFireworkRankAwardTable:getIDs()
	return self.ids_
end

function ActivityFireworkRankAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFireworkRankAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

return ActivityFireworkRankAwardTable
