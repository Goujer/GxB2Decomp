-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/realHurtHpLimitBuff.lua

local realHurtHpLimitBuff = class("realHurtHpLimitBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function realHurtHpLimitBuff:ctor(params)
	realHurtHpLimitBuff.super.ctor(self, params)
end

function realHurtHpLimitBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function realHurtHpLimitBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = -math.floor(self.target:getHpLimit() * self.finalNumArray_[1])

	if #self.finalNumArray_ == 2 then
		local maxNum = self.fighter:getAD() * self.finalNumArray_[2]

		if maxNum < -finalNum then
			finalNum = -maxNum
		end
	end

	return finalNum
end

return realHurtHpLimitBuff
