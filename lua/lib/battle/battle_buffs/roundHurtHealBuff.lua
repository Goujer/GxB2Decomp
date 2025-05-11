-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/roundHurtHealBuff.lua

local roundHurtHealBuff = class("roundHurtHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function roundHurtHealBuff:ctor(params)
	roundHurtHealBuff.super.ctor(self, params)
end

function roundHurtHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function roundHurtHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function roundHurtHealBuff:excuteAfterRound(unit)
	local harm = self.target.roundHarm[xyd.Battle.round - 1] or 0

	if harm <= 0 then
		return
	end

	local healBuff = BuffManager:newBuff({
		noBlockHeal = true,
		skillID = self.skillID,
		target = self.target,
		fighter = self.fighter,
		forceEffectNum = harm * self.finalNumArray_[1]
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
end

return roundHurtHealBuff
