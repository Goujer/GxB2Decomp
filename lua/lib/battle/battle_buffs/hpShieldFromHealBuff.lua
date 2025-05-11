-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldFromHealBuff.lua

local hpShieldFromHealBuff = class("hpShieldFromHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldFromHealBuff:ctor(params)
	hpShieldFromHealBuff.super.ctor(self, params)
end

function hpShieldFromHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldFromHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldFromHealBuff:excuteBuffByHeal(unit, value)
	if value > 0 then
		self.target:addHpShield(unit, value * self.finalNumArray_[1], self.skillID, self.target)
	end
end

return hpShieldFromHealBuff
