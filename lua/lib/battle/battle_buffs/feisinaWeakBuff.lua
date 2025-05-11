-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/feisinaWeakBuff.lua

local feisinaWeakBuff = class("feisinaWeakBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable

function feisinaWeakBuff:ctor(params)
	feisinaWeakBuff.super.ctor(self, params)
end

function feisinaWeakBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function feisinaWeakBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = 0

	self.finalNumArray_ = EffectTable:num(self.effectID, true)
	finalNum = self.finalNumArray_[1]

	return finalNum
end

return feisinaWeakBuff
