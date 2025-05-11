-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hurtSelfHpLoseBuff.lua

local hurtSelfHpLoseBuff = class("hurtSelfHpLoseBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hurtSelfHpLoseBuff:ctor(params)
	hurtSelfHpLoseBuff.super.ctor(self, params)
end

function hurtSelfHpLoseBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hurtSelfHpLoseBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = self:calculateNum(num, true, self.fighter:getHpLimit() - self.fighter:getHp())

	finalNum = -finalNum

	return finalNum
end

function hurtSelfHpLoseBuff:excuteBuff(unit, recordBuffs)
	return
end

function hurtSelfHpLoseBuff:excuteAfterRound(unit)
	return
end

return hurtSelfHpLoseBuff
