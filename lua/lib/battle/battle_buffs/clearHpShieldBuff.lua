-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/clearHpShieldBuff.lua

local clearHpShieldBuff = class("clearHpShieldBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function clearHpShieldBuff:ctor(params)
	clearHpShieldBuff.super.ctor(self, params)
end

function clearHpShieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function clearHpShieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function clearHpShieldBuff:excuteBuff(unit, recordBuffs)
	local costShield = -self.fighter.shieldHp_

	self:updateRecordshield(costShield)
	self:writeRecord(self.fighter, 5)
	unit:recordBuffs(self.fighter, {
		self
	})
	self.fighter:checkRemoveHpShield(unit)

	self.shield = nil

	self:writeRecord(self.fighter, xyd.BUFF_REMOVE)
	unit:recordBuffs(self.fighter, {
		self
	})
	self.fighter:removeBuffs({
		self
	})
end

return clearHpShieldBuff
