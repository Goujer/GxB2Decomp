-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairArenaRankTable.lua

local ActivityFairArenaRankTable = class("ActivityFairArenaRankTable", import("app.common.tables.BaseTable"))

function ActivityFairArenaRankTable:ctor()
	ActivityFairArenaRankTable.super.ctor(self, "activity_fair_arena_rank")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairArenaRankTable:getIDs()
	return self.ids_
end

function ActivityFairArenaRankTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFairArenaRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityFairArenaRankTable:getRankShow(id)
	return self:getString(id, "rank_front")
end

function ActivityFairArenaRankTable:getAwardsByRank(rank)
	for i = 1, #self.ids_ do
		local id = self.ids_[i]
		local front = self:getRank(id)

		if rank < front then
			return self:getAwards(id)
		end
	end

	return {}
end

return ActivityFairArenaRankTable
