-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildCompetitionBossTable.lua

local GuildCompetitionBossTable = class("GuildCompetitionBossTable", import("app.common.tables.BaseTable"))

function GuildCompetitionBossTable:ctor()
	GuildCompetitionBossTable.super.ctor(self, "guild_competition_boss")
end

function GuildCompetitionBossTable:getIds()
	if not self.ids then
		self.ids = {}

		for key, _ in pairs(self.TableLua.rows) do
			table.insert(self.ids, self:getNumber(key, "id"))
		end

		table.sort(self.ids)
	end

	return self.ids
end

function GuildCompetitionBossTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function GuildCompetitionBossTable:getBattleId1(id)
	return self:getNumber(id, "battle_id1_" .. self:getCount())
end

function GuildCompetitionBossTable:getBattleSkill1(id)
	return self:split2num(id, "battle_skill1_" .. self:getCount(), "|")
end

function GuildCompetitionBossTable:getBattleId2(id)
	return self:getNumber(id, "battle_id2_" .. self:getCount())
end

function GuildCompetitionBossTable:getBattleSkill2(id)
	return self:split2num(id, "battle_skill2_" .. self:getCount(), "|")
end

function GuildCompetitionBossTable:getBattleId3(id)
	return self:getNumber(id, "battle_id3_" .. self:getCount())
end

function GuildCompetitionBossTable:getBattleSkill3(id)
	return self:split2num(id, "battle_skill3_" .. self:getCount(), "|")
end

function GuildCompetitionBossTable:getBattleAwards(id)
	return self:split2Cost(id, "battle_awards", "|#")
end

function GuildCompetitionBossTable:getKillAwards(id)
	return self:split2Cost(id, "kill_awards", "|#")
end

function GuildCompetitionBossTable:getPoint(id)
	return self:getNumber(id, "point")
end

function GuildCompetitionBossTable:getRankAwards(id, rank)
	if rank == 1 then
		return self:split2Cost(id, "final_1", "|#")
	elseif rank == 2 then
		return self:split2Cost(id, "final_2", "|#")
	elseif rank == 3 then
		return self:split2Cost(id, "final_3", "|#")
	elseif rank >= 4 and rank <= 10 then
		return self:split2Cost(id, "final_10", "|#")
	elseif rank >= 11 and rank <= 15 then
		return self:split2Cost(id, "final_15", "|#")
	elseif rank >= 16 and rank <= 20 then
		return self:split2Cost(id, "final_20", "|#")
	elseif rank >= 21 then
		return self:split2Cost(id, "final_30", "|#")
	end
end

function GuildCompetitionBossTable:getBattleChallenge1(id)
	return self:split2num(id, "battle_challenge1_" .. self:getCount(), "|")
end

function GuildCompetitionBossTable:getBattleChallenge2(id)
	return self:split2num(id, "battle_challenge2_" .. self:getCount(), "|")
end

function GuildCompetitionBossTable:getBattleChallenge3(id)
	return self:split2num(id, "battle_challenge3_" .. self:getCount(), "|")
end

function GuildCompetitionBossTable:getSkillTips1(id)
	return self:getNumber(id, "skill_tips1_" .. self:getCount())
end

function GuildCompetitionBossTable:getSkillTips2(id)
	return self:getNumber(id, "skill_tips2_" .. self:getCount())
end

function GuildCompetitionBossTable:getSkillTips3(id)
	return self:getNumber(id, "skill_tips3_" .. self:getCount())
end

function GuildCompetitionBossTable:getCount()
	local guildCompetitionData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_COMPETITION)

	if guildCompetitionData then
		return guildCompetitionData:getCount()
	end

	return 1
end

return GuildCompetitionBossTable
