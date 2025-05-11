-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/roundEndHealBuff.lua

local roundEndHealBuff = class("roundEndHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function roundEndHealBuff:ctor(params)
	roundEndHealBuff.super.ctor(self, params)
end

function roundEndHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function roundEndHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function roundEndHealBuff:excuteAfterRound(unit)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)
end

return roundEndHealBuff
