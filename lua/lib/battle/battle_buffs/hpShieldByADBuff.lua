-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldByADBuff.lua

local hpShieldByADBuff = class("hpShieldByADBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldByADBuff:ctor(params)
	hpShieldByADBuff.super.ctor(self, params)
end

function hpShieldByADBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldByADBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldByADBuff:excuteBuff(unit, recordBuffs)
	self.target:addHpShield(unit, self.fighter:getAD() * self.finalNumArray_[1], self.skillID, self.target)
end

return hpShieldByADBuff
