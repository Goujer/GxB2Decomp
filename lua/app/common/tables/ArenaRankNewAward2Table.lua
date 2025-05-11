-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaRankNewAward2Table.lua

local ArenaRankNewAward2Table = class("ArenaRankNewAward2Table", import("app.common.tables.BaseTable"))

function ArenaRankNewAward2Table:ctor()
	local str = "arena_rank_new_award2"

	ArenaRankNewAward2Table.super.ctor(self, str)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ArenaRankNewAward2Table:getRankInfo(rank, id)
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

function ArenaRankNewAward2Table:getRank(id)
	return self:getNumber(id, "rank")
end

function ArenaRankNewAward2Table:getRankText(id)
	return self:getString(id, "rank_front")
end

function ArenaRankNewAward2Table:getAward(id)
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

function ArenaRankNewAward2Table:getSeasonAward(id)
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

function ArenaRankNewAward2Table:getFrameId(id)
	return self:getNumber(id, "frame_id")
end

return ArenaRankNewAward2Table
