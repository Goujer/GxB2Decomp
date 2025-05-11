-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/dotFireTargetMaxHpBuff.lua

local dotFireTargetMaxHpBuff = class("dotFireTargetMaxHpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffTable = xyd.tables.dBuffTable
local SkillTable = xyd.tables.skillTable

function dotFireTargetMaxHpBuff:ctor(params)
	dotFireTargetMaxHpBuff.super.ctor(self, params)
end

function dotFireTargetMaxHpBuff:setIsHit()
	self:baseSetIsHit()
end

function dotFireTargetMaxHpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = num * self.target:getHpLimit()

	if #self.finalNumArray_ == 2 then
		local maxNum = self.fighter:getAD() * self.finalNumArray_[2]

		if maxNum < finalNum then
			finalNum = maxNum
		end
	end

	self:changeBuffName()

	return -finalNum
end

return dotFireTargetMaxHpBuff
