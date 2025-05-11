-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/targetADFireBuff.lua

local targetADFireBuff = class("targetADFireBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function targetADFireBuff:ctor(params)
	targetADFireBuff.super.ctor(self, params)
end

function targetADFireBuff:setIsHit()
	self:baseSetIsHit()
end

function targetADFireBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = self.target:getAD() * self.finalNumArray_[1]

	if finalNum > self.fighter:getAD() * self.finalNumArray_[2] then
		finalNum = self.fighter:getAD() * self.finalNumArray_[2]
	end

	self:changeBuffName()

	return -finalNum
end

return targetADFireBuff
