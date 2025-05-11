-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaRankNewAward3v3Table.lua

local ArenaRankNewAward3v3Table = class("ArenaRankNewAward3v3Table", import("app.common.tables.BaseTable"))

function ArenaRankNewAward3v3Table:ctor()
	ArenaRankNewAward3v3Table.super.ctor(self, "arena_rank_new_award_3v3")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ArenaRankNewAward3v3Table:getRankInfo(rank, id)
	if not id then
		for i = 1, #self.ids_ do
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
		award = self:getSeasonAward(id),
		seasonAward = self:getSeasonAward(id)
	}
end

function ArenaRankNewAward3v3Table:getRank(id)
	return self:getNumber(id, "rank")
end

function ArenaRankNewAward3v3Table:getRankText(id)
	return self:getString(id, "rank_front")
end

function ArenaRankNewAward3v3Table:getAward(id)
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

function ArenaRankNewAward3v3Table:getSeasonAward(id)
	local awards = xyd.split(self:getString(id, "season_awards"), "|")
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

return ArenaRankNewAward3v3Table
