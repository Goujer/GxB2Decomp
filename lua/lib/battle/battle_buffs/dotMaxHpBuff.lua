-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/dotMaxHpBuff.lua

local dotMaxHpBuff = class("dotMaxHpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function dotMaxHpBuff:ctor(params)
	dotMaxHpBuff.super.ctor(self, params)
end

function dotMaxHpBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function dotMaxHpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum_ = self.finalNumArray_[1] * self.target:getHpLimit()

	if finalNum_ < self.finalNumArray_[2] * self.fighter:getAD() then
		finalNum_ = self.finalNumArray_[2] * self.fighter:getAD()
	end

	return -finalNum_
end

return dotMaxHpBuff
