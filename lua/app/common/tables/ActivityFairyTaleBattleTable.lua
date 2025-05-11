-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleBattleTable.lua

local ActivityFairyTaleBattleTable = class("ActivityFairyTaleBattleTable", import(".BaseTable"))

function ActivityFairyTaleBattleTable:ctor()
	ActivityFairyTaleBattleTable.super.ctor(self, "activity_fairytale_battle")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairyTaleBattleTable:getAvatarId(id)
	return self:getNumber(id, "avatar_id")
end

function ActivityFairyTaleBattleTable:getTotalHp(id)
	return self:getNumber(id, "hp")
end

return ActivityFairyTaleBattleTable
