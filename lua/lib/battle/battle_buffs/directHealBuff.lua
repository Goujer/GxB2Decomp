-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/directHealBuff.lua

local directHealBuff = class("directHealBuff", xyd.Battle.getRequire("ReportBuff"))

function directHealBuff:ctor(params)
	directHealBuff.super.ctor(self, params)
end

function directHealBuff:setIsHit()
	self:baseSetIsHit()
end

function directHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = self:updateHealNum(num)

	return finalNum
end

function directHealBuff:isHeal()
	return true
end

return directHealBuff
