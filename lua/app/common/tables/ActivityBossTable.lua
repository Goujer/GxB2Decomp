-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBossTable.lua

local ActivityBossTable = class("ActivityBossTable", import("app.common.tables.BaseTable"))

function ActivityBossTable:ctor()
	ActivityBossTable.super.ctor(self, "activity_boss")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityBossTable:getIDs()
	return self.ids
end

function ActivityBossTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityBossTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function ActivityBossTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function ActivityBossTable:getDropboxID(id)
	return self:getNumber(id, "dropbox_id")
end

function ActivityBossTable:getFinalAward(id)
	return self:split2Cost(id, "final_award", "#")
end

function ActivityBossTable:getHp(id)
	return self:getNumber(id, "hp")
end

function ActivityBossTable:getMonsterHp(id)
	return self:split2Cost(id, "monster_hp", "|")
end

function ActivityBossTable:getLevel(id)
	return self:getNumber(id, "level_tips")
end

return ActivityBossTable
