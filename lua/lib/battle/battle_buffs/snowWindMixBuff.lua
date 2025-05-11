-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/snowWindMixBuff.lua

local snowWindMixBuff = class("snowWindMixBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function snowWindMixBuff:ctor(params)
	snowWindMixBuff.super.ctor(self, params)
end

function snowWindMixBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function snowWindMixBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function snowWindMixBuff:getHurtEnergyRate()
	local result = self.finalNumArray_[1]

	if not self.target:isBackTarget() then
		return result * 2
	end

	return result
end

function snowWindMixBuff:getHealBRate()
	local result = self.finalNumArray_[2]

	if not self.target:isBackTarget() then
		return result * 2
	end

	return result
end

function snowWindMixBuff:getAllHarmFreeRate()
	local result = self.finalNumArray_[3]

	if not self.target:isBackTarget() then
		return result * 2
	end

	return result
end

return snowWindMixBuff
