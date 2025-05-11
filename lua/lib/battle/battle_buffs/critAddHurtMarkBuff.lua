-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/critAddHurtMarkBuff.lua

local critAddHurtMarkBuff = class("critAddHurtMarkBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function critAddHurtMarkBuff:ctor(params)
	critAddHurtMarkBuff.super.ctor(self, params)
end

function critAddHurtMarkBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function critAddHurtMarkBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function critAddHurtMarkBuff:addHurt(unit, harm, target, recordBuffs)
	local finalNum = harm * self.finalNumArray_[1]
	local params1 = {
		fighter = self.fighter,
		target = target,
		skillID = self.skillID
	}
	local buff1 = BuffManager:newBuff(params1)

	buff1.name_ = xyd.BUFF_DIRECT_HURT
	buff1.isHit_ = true
	buff1.finalNum_ = finalNum

	buff1:writeRecord(target, xyd.BUFF_WORK)
	target:updateHpByHarm(finalNum, unit, false, false, false, buff1)
	table.insert(recordBuffs, buff1)
end

return critAddHurtMarkBuff
