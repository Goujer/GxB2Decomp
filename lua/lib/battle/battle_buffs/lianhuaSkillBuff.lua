-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/lianhuaSkillBuff.lua

local lianhuaSkillBuff = class("lianhuaSkillBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function lianhuaSkillBuff:ctor(params)
	lianhuaSkillBuff.super.ctor(self, params)
end

function lianhuaSkillBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	self.recordEnergy = self.fighter:getEnergy()
end

function lianhuaSkillBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function lianhuaSkillBuff:excuteBuff(unit, recordBuffs, status)
	status.isHarm = true

	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		recordEnergy = self.recordEnergy,
		skillID = self.skillID
	}
	local buff1 = BuffManager:addNewBuff(params1, unit)
	local params2 = {
		effectID = self.finalNumArray_[2],
		fighter = self.fighter,
		target = self.target,
		recordEnergy = self.recordEnergy,
		skillID = self.skillID
	}
	local buff2 = BuffManager:addNewBuff(params2, unit)
	local harm = buff1:getRecordNum() + buff2:getRecordNum()

	if harm >= 0 then
		return
	end

	local healBuff = BuffManager:newBuff({
		skillID = self.skillID,
		target = self.fighter,
		fighter = self.fighter,
		forceEffectNum = -harm * self.finalNumArray_[3]
	})

	healBuff.name_ = xyd.BUFF_DIRECT_HEAL

	local num = healBuff.forceEffectNum

	num = num * healBuff.target:getExtraHealRate()
	num = healBuff.target:blockHeal(num, unit, healBuff)

	healBuff.target:updateHpByHeal(num, unit, true)
	healBuff:setRecordNum(num)
	healBuff.fighter:recordData(0, num)
	healBuff:writeRecord(healBuff.target, xyd.BUFF_WORK)
	unit:recordBuffs(healBuff.target, {
		healBuff
	})
end

return lianhuaSkillBuff
