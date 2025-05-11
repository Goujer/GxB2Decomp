-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsRankAward3Table.lua

local ActivitySportsRankAward3Table = class("ActivitySportsRankAward3Table", import(".BaseTable"))

function ActivitySportsRankAward3Table:ctor()
	ActivitySportsRankAward3Table.super.ctor(self, "activity_sports_rank_award3")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySportsRankAward3Table:getRank(id)
	return self:getNumber(id, "rank") or 0
end

function ActivitySportsRankAward3Table:getRankText(id)
	return self:getString(id, "rank_front") or "0"
end

function ActivitySportsRankAward3Table:getAwards(id)
	local awards = xyd.split(self:getString(id, "awards"), "|")
	local result = {}

	for i = 1, #awards do
		local award = xyd.split(awards[i], "#", true)

		table.insert(result, {
			item_id = award[1],
			item_num = award[2]
		})
	end

	return result
end

function ActivitySportsRankAward3Table:getRankInfo(rank, id)
	id = id or rank

	return {
		rank = self:getRank(id),
		rankText = self:getRankText(id),
		award = self:getAwards(id)
	}
end

function ActivitySportsRankAward3Table:getIds()
	return self.ids_
end

return ActivitySportsRankAward3Table
