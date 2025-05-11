-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildWarRankAwardTable.lua

local GuildWarRankAwardTable = class("GuildWarRankAwardTable", import("app.common.tables.BaseTable"))

function GuildWarRankAwardTable:ctor()
	GuildWarRankAwardTable.super.ctor(self, "guild_war_point_award")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, row[colIndexTable.id])
	end

	table.sort(self.ids_)
end

function GuildWarRankAwardTable:getRankInfo(rank, id)
	if not id then
		local i = 1

		while i <= #self.ids_ do
			local interval = xyd.split(self:getRankText(self.ids_[i]), "-", true)

			if not interval[2] and rank == interval[1] then
				id = self.ids_[i]

				break
			elseif rank >= interval[1] and interval[2] and rank <= interval[2] then
				id = self.ids_[i]

				break
			end

			i = i + 1
		end
	end

	return {
		rank = self:getRank(id),
		rankText = self:getRankText(id),
		award = self:getSeasonAward(id),
		seasonAward = self:getSeasonAward(id)
	}
end

function GuildWarRankAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GuildWarRankAwardTable:getRankText(id)
	return self:getString(id, "rank_front")
end

function GuildWarRankAwardTable:getAward(id)
	local awards = xyd.split(self:getString(id, "awards"), "|")
	local result = {}

	do
		local i = 0

		while i < #awards do
			local award = xyd.split(awards[i], "#", true)

			table.insert(result, {
				item_id = award[0],
				item_num = award[1]
			})

			i = i + 1
		end
	end

	return result
end

function GuildWarRankAwardTable:getSeasonAward(id)
	local awards = xyd.split(self:getString(id, "season_awards"), "|")
	local result = {}

	do
		local i = 1

		while i <= #awards do
			local award = xyd.split(awards[i], "#", true)

			table.insert(result, {
				item_id = award[1],
				item_num = award[2]
			})

			i = i + 1
		end
	end

	return result
end

function GuildWarRankAwardTable:getIds()
	return self.ids_
end

return GuildWarRankAwardTable
