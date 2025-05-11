-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/zhousiRecoverBuff.lua

local zhousiRecoverBuff = class("zhousiRecoverBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function zhousiRecoverBuff:ctor(params)
	zhousiRecoverBuff.super.ctor(self, params)
end

function zhousiRecoverBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function zhousiRecoverBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function zhousiRecoverBuff:excuteBuff(unit, recordBuffs)
	self:recoverExcute(unit)
end

function zhousiRecoverBuff:recoverExcute(unit)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff_ = BuffManager:addNewBuff(params1, unit)

	self.target:addHpShield(unit, buff_:getRecordNum(), self.skillID, self.target)
end

function zhousiRecoverBuff:excuteAfterRound(unit)
	self:recoverExcute(unit)
end

return zhousiRecoverBuff
