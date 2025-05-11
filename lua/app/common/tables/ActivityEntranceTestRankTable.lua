-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEntranceTestRankTable.lua

local ActivityEntranceTestRankTable = class("ActivityEntranceTestRankTable", import(".BaseTable"))

function ActivityEntranceTestRankTable:ctor()
	ActivityEntranceTestRankTable.super.ctor(self, "activity_warmup_arena_rank")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ActivityEntranceTestRankTable:getIDs()
	return self.ids_
end

function ActivityEntranceTestRankTable:getName(id)
	return self:getString(id, "name")
end

function ActivityEntranceTestRankTable:getPartnerStar(id)
	return self:getNumber(id, "star")
end

function ActivityEntranceTestRankTable:getPartnerLev(id)
	return self:getNumber(id, "lv")
end

function ActivityEntranceTestRankTable:getPartnerAwake(id)
	return self:getNumber(id, "awake")
end

function ActivityEntranceTestRankTable:getPartnerExSkill(id)
	return self:split2num(id, "elite_skill", "|")
end

function ActivityEntranceTestRankTable:getPotential(id)
	return self:split2num(id, "potential", "|")
end

function ActivityEntranceTestRankTable:getArtifactLev(id)
	return self:getNumber(id, "antique_lv")
end

function ActivityEntranceTestRankTable:getPetLev(id)
	return self:getNumber(id, "pet_lv")
end

function ActivityEntranceTestRankTable:getPetGrade(id)
	return self:getNumber(id, "pet_grade")
end

function ActivityEntranceTestRankTable:getPetSkill(id)
	return self:split2num(id, "pet_skill", "|")
end

function ActivityEntranceTestRankTable:getPetSkillInherit(id)
	return self:getNumber(id, "pet_skill_inherit")
end

function ActivityEntranceTestRankTable:getPetExSkillInherit(id)
	return self:getNumber(id, "pet_exskill_inherit")
end

function ActivityEntranceTestRankTable:getRankPercent(id)
	return self:getNumber(id, "rank_percent")
end

function ActivityEntranceTestRankTable:getPetExskill(id)
	return self:getNumber(id, "pet_exskill")
end

return ActivityEntranceTestRankTable
