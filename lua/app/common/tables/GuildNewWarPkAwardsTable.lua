-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildNewWarPkAwardsTable.lua

local GuildNewWarPkAwardsTable = class("GuildNewWarPkAwardsTable", import("app.common.tables.BaseTable"))

function GuildNewWarPkAwardsTable:ctor()
	GuildNewWarPkAwardsTable.super.ctor(self, "guild_new_war_pk_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildNewWarPkAwardsTable:getIDs()
	return self.ids_
end

function GuildNewWarPkAwardsTable:getWinAwards(id)
	return self:split2Cost(id, "win_awards", "|#", true)
end

function GuildNewWarPkAwardsTable:getLoseAwards(id)
	return self:split2Cost(id, "lose_awards", "|#", true)
end

return GuildNewWarPkAwardsTable
