-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldRecoverBuff.lua

local hpShieldRecoverBuff = class("hpShieldRecoverBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldRecoverBuff:ctor(params)
	hpShieldRecoverBuff.super.ctor(self, params)
end

function hpShieldRecoverBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldRecoverBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldRecoverBuff:excuteAfterRound(unit)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff_ = BuffManager:addNewBuff(params1, unit)

	self.target:addHpShield(unit, buff_:getRecordNum(), self.skillID, self.target)
end

return hpShieldRecoverBuff
