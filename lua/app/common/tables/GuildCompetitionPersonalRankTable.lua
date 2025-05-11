-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildCompetitionPersonalRankTable.lua

local GuildCompetitionPersonalRankTable = class("GuildCompetitionPersonalRankTable", import("app.common.tables.BaseTable"))

function GuildCompetitionPersonalRankTable:ctor()
	GuildCompetitionPersonalRankTable.super.ctor(self, "guild_competition_personal_rank")
end

function GuildCompetitionPersonalRankTable:getIds()
	if not self.ids then
		self.ids = {}

		for key, _ in pairs(self.TableLua.rows) do
			table.insert(self.ids, self:getNumber(key, "id"))
		end

		table.sort(self.ids)
	end

	return self.ids
end

function GuildCompetitionPersonalRankTable:getItems(rank, roundIndex)
	rank = tonumber(rank)

	local nowId = 1

	for i, id in pairs(self:getIds()) do
		if rank <= self:getNumber(id, "rank") then
			nowId = id

			break
		end
	end

	local bossTable = xyd.tables.guildCompetitionBossTable

	return bossTable:getRankAwards(roundIndex, rank)
end

function GuildCompetitionPersonalRankTable:getAwards(rank)
	rank = tonumber(rank)

	local nowId = 1

	for i, id in pairs(self:getIds()) do
		if rank <= self:getNumber(id, "rank") then
			nowId = id

			break
		end
	end

	return self:split2Cost(nowId, "awards", "|#")
end

function GuildCompetitionPersonalRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GuildCompetitionPersonalRankTable:getShow(id)
	return self:getString(id, "show")
end

return GuildCompetitionPersonalRankTable
