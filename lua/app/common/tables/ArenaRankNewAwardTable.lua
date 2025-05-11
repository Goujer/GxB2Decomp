-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaRankNewAwardTable.lua

local ArenaRankNewAwardTable = class("ArenaRankNewAwardTable", import("app.common.tables.BaseTable"))

function ArenaRankNewAwardTable:ctor()
	local str = "arena_rank_new_award"

	ArenaRankNewAwardTable.super.ctor(self, str)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ArenaRankNewAwardTable:getRankInfo(rank, id)
	local firstSeasonOpenTime = xyd.tables.miscTable:getNumber("arena_corss_match_start_time", "value")
	local oneSeasonLength = xyd.tables.miscTable:getNumber("arena_corss_match_continue_time", "value") * 24 * 60 * 60
	local time = math.floor((xyd.getServerTime() - firstSeasonOpenTime - 1814400) / oneSeasonLength) % 2

	if time == 0 then
		-- block empty
	else
		return xyd.tables.arenaRankNewAward2Table:getRankInfo(rank, id)
	end

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

function ArenaRankNewAwardTable:getRank(id)
	local firstSeasonOpenTime = xyd.tables.miscTable:getNumber("arena_corss_match_start_time", "value")
	local oneSeasonLength = xyd.tables.miscTable:getNumber("arena_corss_match_continue_time", "value") * 24 * 60 * 60
	local time = math.floor((xyd.getServerTime() - firstSeasonOpenTime - 1814400) / oneSeasonLength) % 2

	if time == 0 then
		-- block empty
	else
		return xyd.tables.arenaRankNewAward2Table:getRank(id)
	end

	return self:getNumber(id, "rank")
end

function ArenaRankNewAwardTable:getRankText(id)
	local firstSeasonOpenTime = xyd.tables.miscTable:getNumber("arena_corss_match_start_time", "value")
	local oneSeasonLength = xyd.tables.miscTable:getNumber("arena_corss_match_continue_time", "value") * 24 * 60 * 60
	local time = math.floor((xyd.getServerTime() - firstSeasonOpenTime - 1814400) / oneSeasonLength) % 2

	if time == 0 then
		-- block empty
	else
		return xyd.tables.arenaRankNewAward2Table:getRankText(id)
	end

	return self:getString(id, "rank_front")
end

function ArenaRankNewAwardTable:getAward(id)
	local firstSeasonOpenTime = xyd.tables.miscTable:getNumber("arena_corss_match_start_time", "value")
	local oneSeasonLength = xyd.tables.miscTable:getNumber("arena_corss_match_continue_time", "value") * 24 * 60 * 60
	local time = math.floor((xyd.getServerTime() - firstSeasonOpenTime - 1814400) / oneSeasonLength) % 2

	if time == 0 then
		-- block empty
	else
		return xyd.tables.arenaRankNewAward2Table:getAward(id)
	end

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

function ArenaRankNewAwardTable:getSeasonAward(id)
	local firstSeasonOpenTime = xyd.tables.miscTable:getNumber("arena_corss_match_start_time", "value")
	local oneSeasonLength = xyd.tables.miscTable:getNumber("arena_corss_match_continue_time", "value") * 24 * 60 * 60
	local time = math.floor((xyd.getServerTime() - firstSeasonOpenTime - 1814400) / oneSeasonLength) % 2

	if time == 0 then
		-- block empty
	else
		return xyd.tables.arenaRankNewAward2Table:getSeasonAward(id)
	end

	local awards = xyd.split(self:getString(id, "season_awards"), "|")
	local result = {}

	for i = 1, #awards do
		local award = xyd.split(awards[i], "#", true)

		table.insert(result, {
			item_id = award[1],
			item_num = award[2]
		})
	end

	local frame = self:getFrameId(id)

	if frame and frame ~= 0 then
		table.insert(result, {
			item_num = 1,
			item_id = frame
		})
	end

	return result
end

function ArenaRankNewAwardTable:getFrameId(id)
	local firstSeasonOpenTime = xyd.tables.miscTable:getNumber("arena_corss_match_start_time", "value")
	local oneSeasonLength = xyd.tables.miscTable:getNumber("arena_corss_match_continue_time", "value") * 24 * 60 * 60
	local time = math.floor((xyd.getServerTime() - firstSeasonOpenTime - 1814400) / oneSeasonLength) % 2

	if time == 0 then
		-- block empty
	else
		return xyd.tables.arenaRankNewAward2Table:getFrameId(id)
	end

	return self:getNumber(id, "frame_id")
end

return ArenaRankNewAwardTable
