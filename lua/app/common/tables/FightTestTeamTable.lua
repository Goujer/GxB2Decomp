-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FightTestTeamTable.lua

local FightTestTeamTable = class("FightTestTeamTable", import("app.common.tables.BaseTable"))

function FightTestTeamTable:ctor()
	FightTestTeamTable.super.ctor(self, "fight_test_team")
end

function FightTestTeamTable:getPartnerIDs(id)
	return self:split2num(id, "partner_ids", "|")
end

function FightTestTeamTable:getStands(id)
	return self:split2num(id, "stands", "|")
end

function FightTestTeamTable:getPetInfo(id)
	if self:getNumber(id, "pet") == 0 then
		return
	end

	return {
		pet_id = self:getNumber(id, "pet"),
		grade = self:getNumber(id, "pet_grade"),
		lv = self:getNumber(id, "pet_level"),
		skills = self:split2num(id, "pet_skill_level", "|"),
		ex_lv = self:getNumber(id, "pet_exskill")
	}
end

function FightTestTeamTable:getGodSkill(id)
	return self:split2num(id, "god_skill", "|")
end

function FightTestTeamTable:getGuildSkills(id)
	return self:split2num(id, "guild_skill", "|")
end

return FightTestTeamTable
