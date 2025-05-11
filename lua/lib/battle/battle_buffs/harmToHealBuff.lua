-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/harmToHealBuff.lua

local harmToHealBuff = class("harmToHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function harmToHealBuff:ctor(params)
	harmToHealBuff.super.ctor(self, params)
end

function harmToHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function harmToHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function harmToHealBuff:hitted(unit, harm, harmBuff, buffFighter)
	if not buffFighter or harm >= 0 then
		return
	end

	if harmBuff then
		if harmBuff:getName() == xyd.BUFF_REAL_HURT or harmBuff:getName() == xyd.BUFF_HEAL_CURSE or harmBuff.isCopy then
			return
		end
	else
		return
	end

	if buffFighter:getTeamType() == self.target:getTeamType() then
		return
	end

	if harmBuff:isCrit() then
		self.target:addHpShield(unit, -harm * self.finalNumArray_[2], self.skillID, self.target)
	else
		local healBuff = BuffManager:newBuff({
			isCopy = true,
			skillID = self.skillID,
			target = self.target,
			fighter = self.fighter,
			forceEffectNum = -harm * self.finalNumArray_[1]
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
end

return harmToHealBuff
