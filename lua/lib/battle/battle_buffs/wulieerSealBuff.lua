-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/wulieerSealBuff.lua

local wulieerSealBuff = class("wulieerSealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function wulieerSealBuff:ctor(params)
	wulieerSealBuff.super.ctor(self, params)
end

function wulieerSealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function wulieerSealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function wulieerSealBuff:excuteBuffByRemove(unit)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)
end

return wulieerSealBuff
