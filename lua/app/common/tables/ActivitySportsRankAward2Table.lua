-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsRankAward2Table.lua

local BaseTable = import(".BaseTable")
local ActivitySportsRankAward2Table = class("ActivitySportsRankAward2Table", BaseTable)

function ActivitySportsRankAward2Table:ctor()
	ActivitySportsRankAward2Table.super.ctor(self, "activity_sports_rank_award2")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySportsRankAward2Table:getIds()
	return self.ids_
end

function ActivitySportsRankAward2Table:getRankInfo(rank, id)
	rank = tonumber(rank)

	if not id and rank then
		for i in pairs(self.ids_) do
			local interval = xyd.split(self:getRankText(self.ids_[i]), "-", true)

			if not interval[2] and rank == interval[1] then
				id = self.ids_[i]

				break
			elseif interval[2] and rank >= interval[1] and rank <= interval[2] then
				id = self.ids_[i]

				break
			end
		end
	end

	return {
		rank = self:getRank(id),
		rankText = self:getRankText(id),
		award = self:getAwards(id),
		seasonAward = self:getSeasonAward(id)
	}
end

function ActivitySportsRankAward2Table:getRank(id)
	return self:getNumber(id, "rank") or "0"
end

function ActivitySportsRankAward2Table:getRankText(id)
	return self:getString(id, "rank_front") or "0"
end

function ActivitySportsRankAward2Table:getSeasonAward(id)
	local awards = xyd.split(self:getString(id, "season_awards"), "|")
	local result = {}

	for i in pairs(awards) do
		local award = xyd.split(awards[i], "#", true)

		table.insert(result, {
			item_id = award[1],
			item_num = award[2]
		})
	end

	return result
end

function ActivitySportsRankAward2Table:getAwards(id)
	local awards = xyd.split(self:getString(id, "awards"), "|")
	local awards2 = xyd.split(self:getString(id, "awards2"), "|")

	for i in pairs(awards2) do
		table.insert(awards, awards2[i])
	end

	local result = {}

	for i in pairs(awards) do
		local award = xyd.split(awards[i], "#", true)

		if award[1] then
			table.insert(result, {
				item_id = award[1],
				item_num = award[2]
			})
		end
	end

	return result
end

return ActivitySportsRankAward2Table
