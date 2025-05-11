-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpPercentHealBBuff.lua

local hpPercentHealBBuff = class("hpPercentHealBBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpPercentHealBBuff:ctor(params)
	hpPercentHealBBuff.super.ctor(self, params)
end

function hpPercentHealBBuff:setIsHit()
	self:baseSetIsHit()
end

function hpPercentHealBBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpPercentHealBBuff:getHealRate()
	local hpPercent = self.target:getHp() / self.target:getHpLimit()
	local x1 = self.finalNumArray_[1]
	local x2 = self.finalNumArray_[2]

	return (x2 - x1) * hpPercent + x1
end

return hpPercentHealBBuff
