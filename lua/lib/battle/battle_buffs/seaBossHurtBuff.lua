-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/seaBossHurtBuff.lua

local seaBossHurt = class("seaBossHurt", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function seaBossHurt:ctor(params)
	seaBossHurt.super.ctor(self, params)
end

function seaBossHurt:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function seaBossHurt:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function seaBossHurt:excuteBuff(unit, recordBuffs)
	local effectNum = (1 + (self.fighter.infRebornTimes_ + 1) * self.finalNumArray_[1]) * self.finalNumArray_[2]
	local params1 = {
		effectID = 10190049,
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID,
		forceEffectNum = effectNum
	}

	BuffManager:addNewBuff(params1, unit)
end

return seaBossHurt
