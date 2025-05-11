-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialRewardTable.lua

local NewTrialRewardTable = class("NewTrialRewardTable", import("app.common.tables.BaseTable"))

function NewTrialRewardTable:ctor()
	NewTrialRewardTable.super.ctor(self, "new_trial_boss_reward")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function NewTrialRewardTable:getIds()
	return self.ids_
end

function NewTrialRewardTable:getDamageToBoss(id)
	if id == 0 then
		return 0
	end

	return self:getNumber(id, "damage_to_boss") or self:getNumber(#self.ids_, "damage_to_boss")
end

function NewTrialRewardTable:getReward(id)
	return self:split2num(id, "rewards", "|")
end

function NewTrialRewardTable:getLevByDamage(damage)
	local ids = self.ids_
	local res = 0

	for i = 1, #ids do
		local id = ids[i]
		local lev_damage = self:getDamageToBoss(id)

		if damage < lev_damage then
			return res
		end

		res = id
	end

	return res
end

function NewTrialRewardTable:getRewardsOnAccount(id)
	local result = {}
	local arr = self:split(id, "rewards_on_account_" .. xyd.models.trial:getBossRewardLev(), "$")

	for _, item in ipairs(arr) do
		local arrItem = {}
		local itemArr = xyd.split(item, "|")

		for _, award in ipairs(itemArr) do
			local theItem = xyd.split(award, "#")

			table.insert(arrItem, theItem)
		end

		table.insert(result, arrItem)
	end

	return result
end

function NewTrialRewardTable:getRewardsEffect(id)
	return self:split(id, "rewards_icon_effect", "|")
end

return NewTrialRewardTable
