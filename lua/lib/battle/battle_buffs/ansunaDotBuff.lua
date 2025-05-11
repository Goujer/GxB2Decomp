-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ansunaDotBuff.lua

local ansunaDotBuff = class("ansunaDotBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function ansunaDotBuff:ctor(params)
	ansunaDotBuff.super.ctor(self, params)
end

function ansunaDotBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function ansunaDotBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = self.finalNumArray_[2]
	local attacker = self.fighter
	local defender = self.target
	local dRate = defender:getHujia() / (200 + (defender:getLevel() - 1) * 20) * (1 - attacker:getDHuJia())
	local rate = 1 - math.min(dRate, 0.9)

	finalNum = finalNum * rate
	finalNum = finalNum + 0.7 * attacker:getTrueAtk()

	local defenderDecDmg = defender:getJianshang()

	if attacker:isDecDmgFree() then
		defenderDecDmg = 0
	end

	finalNum = finalNum * (1 - defenderDecDmg)
	finalNum = finalNum * self.target:getAD()

	if finalNum > self.fighter:getAD() * self.finalNumArray_[3] then
		finalNum = self.fighter:getAD() * self.finalNumArray_[3]
	end

	return -finalNum
end

return ansunaDotBuff
