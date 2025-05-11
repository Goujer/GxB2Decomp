-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpDotBloodBuff.lua

local hpDotBloodBuff = class("hpDotBloodBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffTable = xyd.tables.dBuffTable
local SkillTable = xyd.tables.skillTable

function hpDotBloodBuff:ctor(params)
	hpDotBloodBuff.super.ctor(self, params)
end

function hpDotBloodBuff:setIsHit()
	self:baseSetIsHit()
end

function hpDotBloodBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = num * self.target:getHpLimit()

	self:changeBuffName()

	return -finalNum
end

return hpDotBloodBuff
