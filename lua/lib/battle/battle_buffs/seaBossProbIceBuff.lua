-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/seaBossProbIceBuff.lua

local seaBossProbIceBuff = class("seaBossProbIceBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function seaBossProbIceBuff:ctor(params)
	seaBossProbIceBuff.super.ctor(self, params)
end

function seaBossProbIceBuff:setIsHit(tmpBuffs)
	self.isHit_ = true
end

function seaBossProbIceBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function seaBossProbIceBuff:excuteBuff(unit, recordBuffs)
	local prob = self.finalNumArray_[1] + (self.fighter.infRebornTimes_ + 1) * self.finalNumArray_[2]
	local params1 = {
		effectID = self.finalNumArray_[3],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID,
		forceEffectProb = prob
	}

	BuffManager:addNewBuff(params1, unit, true)
end

return seaBossProbIceBuff
