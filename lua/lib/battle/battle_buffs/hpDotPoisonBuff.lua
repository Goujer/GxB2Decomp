-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpDotPoisonBuff.lua

local hpDotPoisonBuff = class("hpDotPoisonBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffTable = xyd.tables.dBuffTable
local SkillTable = xyd.tables.skillTable

function hpDotPoisonBuff:ctor(params)
	hpDotPoisonBuff.super.ctor(self, params)
end

function hpDotPoisonBuff:setIsHit()
	self:baseSetIsHit()
end

function hpDotPoisonBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = num * self.target:getHpLimit()
	local maxNum = self.fighter:getAD() * 15

	if not self.fighter:isGod() and maxNum < finalNum then
		finalNum = maxNum
	end

	self:changeBuffName()

	return -finalNum
end

return hpDotPoisonBuff
