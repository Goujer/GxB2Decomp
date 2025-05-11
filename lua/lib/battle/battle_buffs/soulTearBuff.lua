-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/soulTearBuff.lua

local soulTearBuff = class("soulTearBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function soulTearBuff:ctor(params)
	soulTearBuff.super.ctor(self, params)
end

function soulTearBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function soulTearBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function soulTearBuff:afterAttack(unit, totalHarm)
	local finalNum = totalHarm * self.finalNumArray_[1]

	if finalNum > self.fighter:getAD() * self.finalNumArray_[2] then
		finalNum = self.fighter:getAD() * self.finalNumArray_[2]
	end

	local params1 = {
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff1 = BuffManager:newBuff(params1)

	buff1.name_ = xyd.BUFF_DIRECT_HURT
	buff1.isHit_ = true
	buff1.finalNum_ = -finalNum

	params1.target:applyBuffHarm(unit, {
		buff1
	}, false, true)
end

return soulTearBuff
