-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/monikaBossHealBuff.lua

local monikaBossHealBuff = class("monikaBossHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function monikaBossHealBuff:ctor(params)
	monikaBossHealBuff.super.ctor(self, params)
end

function monikaBossHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function monikaBossHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function monikaBossHealBuff:excuteAfterRound(unit)
	if self.target:getHpPercent() >= self.finalNumArray_[1] then
		return
	end

	if self.target.monikaBossHealTimes and self.target.monikaBossHealTimes >= self.finalNumArray_[3] then
		return
	end

	if not self.target.monikaBossHealTimes then
		self.target.monikaBossHealTimes = 1
	else
		self.target.monikaBossHealTimes = self.target.monikaBossHealTimes + 1
	end

	local params1 = {
		noBlockHeal = true,
		effectID = self.finalNumArray_[2],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)
end

return monikaBossHealBuff
