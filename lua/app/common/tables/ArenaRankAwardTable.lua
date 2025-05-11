-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaRankAwardTable.lua

local ArenaRankAwardTable = class("ArenaRankAwardTable", import("app.common.tables.BaseTable"))

function ArenaRankAwardTable:ctor()
	ArenaRankAwardTable.super.ctor(self, "arena_rank_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ArenaRankAwardTable:getRankInfo(rank, id)
	if not id then
		for i = 1, #self.ids_ do
			local interval = xyd.split(self:getRankText(self.ids_[i]), "-", true)

			if not interval[2] then
				if rank == interval[1] then
					id = self.ids_[i]

					break
				end
			elseif rank >= interval[1] and rank <= interval[2] then
				id = self.ids_[i]

				break
			end
		end
	end

	return {
		rank = self:getRank(id),
		rankText = self:getRankText(id),
		award = self:getAward(id),
		seasonAward = self:getSeasonAward(id)
	}
end

function ArenaRankAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ArenaRankAwardTable:getRankText(id)
	return self:getString(id, "rank_front")
end

function ArenaRankAwardTable:getAward(id)
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

function ArenaRankAwardTable:getSeasonAward(id)
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

return ArenaRankAwardTable
