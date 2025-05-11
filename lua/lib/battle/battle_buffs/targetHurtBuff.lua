-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/targetHurtBuff.lua

local targetHurtBuff = class("targetHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function targetHurtBuff:ctor(params)
	targetHurtBuff.super.ctor(self, params)
end

function targetHurtBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function targetHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local adNum = self.target:getAD() * self.finalNumArray_[1]

	if #self.finalNumArray_ > 1 and adNum > self.fighter:getAD() * self.finalNumArray_[2] then
		adNum = self.fighter:getAD() * self.finalNumArray_[2]
	end

	local extraData = {
		adNum = adNum
	}
	local finalNum = self:calculateHurtNum(self:getName(), 1, buffData, extraData)

	return finalNum
end

return targetHurtBuff
