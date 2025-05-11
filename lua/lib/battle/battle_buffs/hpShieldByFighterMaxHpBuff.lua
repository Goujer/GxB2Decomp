-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldByFighterMaxHpBuff.lua

local hpShieldByFighterMaxHpBuff = class("hpShieldByFighterMaxHpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldByFighterMaxHpBuff:ctor(params)
	hpShieldByFighterMaxHpBuff.super.ctor(self, params)
end

function hpShieldByFighterMaxHpBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldByFighterMaxHpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldByFighterMaxHpBuff:excuteBuff(unit, recordBuffs)
	self.target:addHpShield(unit, self.fighter:getHpLimit() * self.finalNumArray_[1], self.skillID, self.target)
end

return hpShieldByFighterMaxHpBuff
