-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldAndRecoverBuff.lua

local hpShieldAndRecoverBuff = class("hpShieldAndRecoverBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldAndRecoverBuff:ctor(params)
	hpShieldAndRecoverBuff.super.ctor(self, params)
end

function hpShieldAndRecoverBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldAndRecoverBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldAndRecoverBuff:excuteBuff(unit, recordBuffs)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff_ = BuffManager:addNewBuff(params1, unit)

	self.target:addHpShield(unit, buff_:getRecordNum(), self.skillID, self.target)
end

return hpShieldAndRecoverBuff
