-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitBossAwardTable.lua

local ActivityLimitBossAwardTable = class("ActivityLimitBossAwardTable", import("app.common.tables.BaseTable"))

function ActivityLimitBossAwardTable:ctor()
	ActivityLimitBossAwardTable.super.ctor(self, "activity_limit_boss_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityLimitBossAwardTable:getIds()
	return self.ids_
end

function ActivityLimitBossAwardTable:getDamage(id)
	if id == 0 then
		return 0
	end

	return self:getNumber(id, "damage") or self:getNumber(#self.ids_, "damage")
end

function ActivityLimitBossAwardTable:getDamageToBoss(id)
	return self:getDamage(id)
end

function ActivityLimitBossAwardTable:getLevByDamage(damage)
	local ids = self.ids_
	local res = 0

	for i = 1, #ids do
		local id = ids[i]
		local lev_damage = self:getDamage(id)

		if damage < lev_damage then
			return res
		end

		res = id
	end

	return res
end

function ActivityLimitBossAwardTable:getReward(id)
	return self:split2Cost(id, "award", "|#")
end

return ActivityLimitBossAwardTable
