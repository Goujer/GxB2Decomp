-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildNewWarPersonRankTable.lua

local GuildNewWarPersonRankTable = class("GuildNewWarPersonRankTable", import("app.common.tables.BaseTable"))

function GuildNewWarPersonRankTable:ctor()
	GuildNewWarPersonRankTable.super.ctor(self, "guild_new_war_person_rank")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildNewWarPersonRankTable:getIDs()
	return self.ids_
end

function GuildNewWarPersonRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GuildNewWarPersonRankTable:getRankFront(id)
	return self:getString(id, "rank_front")
end

function GuildNewWarPersonRankTable:getPersonAwards(id)
	return self:split2Cost(id, "person_awards", "|#", true)
end

function GuildNewWarPersonRankTable:getMailId(id)
	return self:getNumber(id, "mail_id")
end

function GuildNewWarPersonRankTable:getAwardsWithRank(rank)
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

	return self:getPersonAwards(searchId)
end

return GuildNewWarPersonRankTable
