-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldByHpBuff.lua

local hpShieldByHpBuff = class("hpShieldByHpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldByHpBuff:ctor(params)
	hpShieldByHpBuff.super.ctor(self, params)
end

function hpShieldByHpBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldByHpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldByHpBuff:excuteBuff(unit, recordBuffs)
	self.target:addHpShield(unit, self.target:getHp() * self.finalNumArray_[1], self.skillID, self.target)
end

return hpShieldByHpBuff
