-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSecretBossRewardTable.lua

local ActivityIceSecretBossRewardTable = class("ActivityIceSecretBossRewardTable", import("app.common.tables.BaseTable"))

function ActivityIceSecretBossRewardTable:ctor()
	ActivityIceSecretBossRewardTable.super.ctor(self, "activity_ice_secret_boss_reward")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityIceSecretBossRewardTable:getIds()
	return self.ids_
end

function ActivityIceSecretBossRewardTable:getDamage(id)
	if id == 0 then
		return 0
	end

	return self:getNumber(id, "damage") or self:getNumber(#self.ids_, "damage")
end

function ActivityIceSecretBossRewardTable:getDamageToBoss(id)
	return self:getDamage(id)
end

function ActivityIceSecretBossRewardTable:getLevByDamage(damage)
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

function ActivityIceSecretBossRewardTable:getReward(id)
	return self:split2num(id, "reward", "#")
end

return ActivityIceSecretBossRewardTable
