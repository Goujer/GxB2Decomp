-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthlyStageTable.lua

local ActivityMonthlyStageTable = class("ActivityMonthlyStageTable", import("app.common.tables.BaseTable"))

function ActivityMonthlyStageTable:ctor()
	ActivityMonthlyStageTable.super.ctor(self, "activity_monthly_stage")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityMonthlyStageTable:getIds()
	return self.ids_
end

function ActivityMonthlyStageTable:getChapter(id)
	return self:getNumber(id, "chapter")
end

function ActivityMonthlyStageTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivityMonthlyStageTable:getMap(id)
	return self:getNumber(id, "map")
end

function ActivityMonthlyStageTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function ActivityMonthlyStageTable:getPreId(id)
	return self:getNumber(id, "pre_id")
end

function ActivityMonthlyStageTable:getBattleAwards(id)
	return self:split2Cost(id, "final_awards", "|#")
end

function ActivityMonthlyStageTable:getVictoryAwards(id)
	return self:split2num(id, "victory_awards", "|#")
end

function ActivityMonthlyStageTable:getNextID(id)
	return self:getNumber(id, "next_id")
end

function ActivityMonthlyStageTable:getSkillPoint(id)
	return self:getNumber(id, "skill_point")
end

function ActivityMonthlyStageTable:getLimitTimes(id)
	return self:getNumber(id, "times_limit")
end

return ActivityMonthlyStageTable
