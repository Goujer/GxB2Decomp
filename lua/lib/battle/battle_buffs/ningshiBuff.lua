-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ningshiBuff.lua

local ningshiBuff = class("ningshiBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function ningshiBuff:ctor(params)
	ningshiBuff.super.ctor(self, params)
end

function ningshiBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function ningshiBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = self.finalNumArray_[2]
	local attacker = self.fighter
	local defender = self.target
	local dRate = defender:getHujia() / (200 + (defender:getLevel() - 1) * 20) * (1 - attacker:getDHuJia())
	local rate = 1 - math.min(dRate, 0.9)

	finalNum = finalNum * rate

	local defenderDecDmg = defender:getJianshang()

	finalNum = finalNum * (1 - defenderDecDmg)
	finalNum = finalNum * self.target:getAD()

	return -finalNum
end

function ningshiBuff:excuteBuff(unit, recordBuffs)
	self:excuteEffect(unit, recordBuffs)
end

function ningshiBuff:excuteAfterRound(unit)
	self:excuteEffect(unit)
end

function ningshiBuff:excuteEffect(unit, recordBuffs)
	self.target:addEnergy(-self.finalNumArray_[3], unit)
end

return ningshiBuff
