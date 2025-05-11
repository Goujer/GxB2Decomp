-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmupArenaBossTable.lua

local ActivityWarmupArenaBossTable = class("ActivityWarmupArenaBossTable", import("app.common.tables.BaseTable"))

function ActivityWarmupArenaBossTable:ctor()
	ActivityWarmupArenaBossTable.super.ctor(self, "activity_warmup_arena_boss")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityWarmupArenaBossTable:getIDs()
	return self.ids_
end

function ActivityWarmupArenaBossTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function ActivityWarmupArenaBossTable:getBossScore(id)
	return self:getNumber(id, "boss_score")
end

return ActivityWarmupArenaBossTable
