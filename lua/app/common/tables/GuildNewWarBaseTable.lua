-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildNewWarBaseTable.lua

local GuildNewWarBaseTable = class("GuildNewWarBaseTable", import("app.common.tables.BaseTable"))

function GuildNewWarBaseTable:ctor()
	GuildNewWarBaseTable.super.ctor(self, "guild_new_war_base")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildNewWarBaseTable:getIDs()
	return self.ids_
end

function GuildNewWarBaseTable:getType(id)
	return self:getNumber(id, "type")
end

function GuildNewWarBaseTable:getFlagNum(id)
	return self:getNumber(id, "flag_num")
end

function GuildNewWarBaseTable:getSkillId(id)
	return self:getNumber(id, "skill_id")
end

function GuildNewWarBaseTable:getGuildPoints(id)
	return self:getNumber(id, "guild_points")
end

function GuildNewWarBaseTable:getAttackWinAwards(id)
	return self:split2Cost(id, "attack_win_awards", "|#", true)
end

function GuildNewWarBaseTable:getAttackLoseAwards(id)
	return self:split2Cost(id, "attack_lose_awards", "|#", true)
end

function GuildNewWarBaseTable:getSweepAwards(id)
	return self:split2Cost(id, "sweep_awards", "|#", true)
end

function GuildNewWarBaseTable:getFlagAwards(id)
	return self:split2Cost(id, "flag_awards", "|#", true)
end

function GuildNewWarBaseTable:getTextId1(id)
	return self:getNumber(id, "text_id1")
end

function GuildNewWarBaseTable:getTextId2(id)
	return self:getNumber(id, "text_id2")
end

return GuildNewWarBaseTable
