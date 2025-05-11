-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/qianheziHealBuff.lua

local qianheziHealBuff = class("qianheziHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")
local GetTarget_ = xyd.Battle.getRequire("GetTarget")
local battle_event = xyd.Battle.getRequire("battle_event")

function qianheziHealBuff:ctor(params)
	qianheziHealBuff.super.ctor(self, params)

	self.roundHealTimes = {}
end

function qianheziHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function qianheziHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function qianheziHealBuff:cureByBuff(unit, value)
	if not self.roundHealTimes[xyd.Battle.round] then
		self.roundHealTimes[xyd.Battle.round] = 0
	end

	self.roundHealTimes[xyd.Battle.round] = self.roundHealTimes[xyd.Battle.round] + 1

	if self.roundHealTimes[xyd.Battle.round] >= 10 or value <= 0 then
		return
	end

	local lowestEnemy = GetTarget_.S3(self.fighter)[1]
	local lowestFriend = GetTarget_.S3(self.target)[1]

	if not lowestEnemy then
		return
	end

	local healBuff = BuffManager:newBuff({
		skillID = self.skillID,
		target = lowestEnemy,
		fighter = self.fighter,
		forceEffectNum = value
	})

	healBuff.name_ = xyd.BUFF_DIRECT_HEAL

	local num = healBuff.forceEffectNum

	num = num * healBuff.target:getExtraHealRate()
	num = healBuff.target:blockHeal(num, unit, healBuff)

	healBuff.target:updateHpByHeal(num, unit, true)
	healBuff:setRecordNum(num)
	healBuff.fighter:recordData(0, num)
	healBuff:writeRecord(healBuff.target, xyd.BUFF_WORK)
	unit:recordPasBuffs(healBuff.target, {
		healBuff
	})

	if not lowestFriend then
		return
	end

	local params1 = {
		fighter = self.fighter,
		target = lowestFriend,
		skillID = self.skillID
	}
	local buff1 = BuffManager:newBuff(params1)

	buff1.name_ = xyd.BUFF_DIRECT_HURT
	buff1.isHit_ = true

	local finalNum = -num * lowestFriend:getSuperDecHurtRate(buff1)

	finalNum = finalNum + lowestFriend:getDecHurtNum()
	finalNum = math.min(finalNum, 0)
	buff1.finalNum_ = finalNum

	params1.target:applyBuffHarm(unit, {
		buff1
	}, false, true)
end

return qianheziHealBuff
