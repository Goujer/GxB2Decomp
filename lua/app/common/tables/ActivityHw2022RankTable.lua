-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHw2022RankTable.lua

local ActivityHw2022RankTable = class("ActivityHw2022RankTable", import("app.common.tables.BaseTable"))

function ActivityHw2022RankTable:ctor()
	ActivityHw2022RankTable.super.ctor(self, "activity_halloween2022_rank")

	self.ids_ = {}
	self.maxID_ = 0

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		self.maxID_ = self.maxID_ + 1
	end

	table.sort(self.ids_)
end

function ActivityHw2022RankTable:getMaxID()
	return self.maxID_
end

function ActivityHw2022RankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityHw2022RankTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityHw2022RankTable:getShowRank(id)
	return self:getString(id, "rank_front")
end

function ActivityHw2022RankTable:getShowByRank(rank)
	for id = 1, self.maxID_ do
		if rank <= self:getRank(id) then
			return self:getShowRank(id)
		end
	end

	return nil
end

function ActivityHw2022RankTable:getAwardsByRank(rank)
	if rank < 0 then
		return {}
	end

	for id = 1, self.maxID_ do
		if rank <= self:getRank(id) then
			return self:getAwards(id)
		end
	end

	return {}
end

return ActivityHw2022RankTable
