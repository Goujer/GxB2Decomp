-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldByMaxHpTimesBuff.lua

local hpShieldByMaxHpTimesBuff = class("hpShieldByMaxHpTimesBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldByMaxHpTimesBuff:ctor(params)
	hpShieldByMaxHpTimesBuff.super.ctor(self, params)
end

function hpShieldByMaxHpTimesBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	if self.isHit_ then
		if not self.target.hphpShieldByMaxHpTimesRound or self.target.hphpShieldByMaxHpTimesRound ~= xyd.Battle.round then
			self.target.hphpShieldByMaxHpTimesRound = xyd.Battle.round
			self.target.hpShieldByMaxHpTimes = 0
		end

		self.target.hpShieldByMaxHpTimes = self.target.hpShieldByMaxHpTimes + 1

		if self.target.hpShieldByMaxHpTimes > self.finalNumArray_[2] then
			self.isHit_ = false
		end
	end
end

function hpShieldByMaxHpTimesBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldByMaxHpTimesBuff:excuteBuff(unit, recordBuffs)
	self.target:addHpShield(unit, self.target:getHpLimit() * self.finalNumArray_[1], self.skillID, self.target)
end

return hpShieldByMaxHpTimesBuff
