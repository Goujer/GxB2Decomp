-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldByMaxHpBuff.lua

local hpShieldByMaxHpBuff = class("hpShieldByMaxHpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldByMaxHpBuff:ctor(params)
	hpShieldByMaxHpBuff.super.ctor(self, params)
end

function hpShieldByMaxHpBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldByMaxHpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldByMaxHpBuff:excuteBuff(unit, recordBuffs)
	self.target:addHpShield(unit, self.target:getHpLimit() * self.finalNumArray_[1], self.skillID, self.target)
end

return hpShieldByMaxHpBuff
