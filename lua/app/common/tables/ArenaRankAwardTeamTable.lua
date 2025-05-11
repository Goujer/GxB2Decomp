-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaRankAwardTeamTable.lua

local ArenaRankAwardTeamTable = class("ArenaRankAwardTeamTable", import("app.common.tables.BaseTable"))

function ArenaRankAwardTeamTable:ctor()
	ArenaRankAwardTeamTable.super.ctor(self, "arena_rank_award_team")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function ArenaRankAwardTeamTable:getRankInfo(rank, id)
	if not id then
		for i = 1, #self.ids_ do
			local interval = xyd.split(self:getRankText(self.ids_[i]), "-", true)

			print(interval[1], interval[2], rank)

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

function ArenaRankAwardTeamTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ArenaRankAwardTeamTable:getRankText(id)
	return self:getString(id, "rank_front")
end

function ArenaRankAwardTeamTable:getAward(id)
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

function ArenaRankAwardTeamTable:getSeasonAward(id)
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

return ArenaRankAwardTeamTable
