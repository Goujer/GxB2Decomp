-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildNewWarGuildRankTable.lua

local GuildNewWarGuildRankTable = class("GuildNewWarGuildRankTable", import("app.common.tables.BaseTable"))

function GuildNewWarGuildRankTable:ctor()
	GuildNewWarGuildRankTable.super.ctor(self, "guild_new_war_guild_rank")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildNewWarGuildRankTable:getIDs()
	return self.ids_
end

function GuildNewWarGuildRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GuildNewWarGuildRankTable:getRankFront(id)
	return self:getString(id, "rank_front")
end

function GuildNewWarGuildRankTable:getSeasonAwards(id)
	return self:split2Cost(id, "season_awards", "|#", true)
end

function GuildNewWarGuildRankTable:getMailId(id)
	return self:getNumber(id, "mail_id")
end

function GuildNewWarGuildRankTable:getAwardsWithRank(rank)
	local searchId = self.ids_[#self.ids_]

	for i, id in pairs(self.ids_) do
		local checkRank = self:getRank(id)

		if i == #self.ids_ then
			checkRank = 999999999
		end

		if rank <= checkRank then
			searchId = id

			break
		end
	end

	return self:getSeasonAwards(searchId)
end

return GuildNewWarGuildRankTable
