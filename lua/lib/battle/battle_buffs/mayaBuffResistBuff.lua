﻿-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/mayaBuffResistBuff.lua

local mayaBuffResistBuff = class("mayaBuffResistBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function mayaBuffResistBuff:ctor(params)
	mayaBuffResistBuff.super.ctor(self, params)
end

function mayaBuffResistBuff:setIsHit()
	self:baseSetIsHit()
end

function mayaBuffResistBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function mayaBuffResistBuff:excuteResist(hitBuffs, unit)
	local params1 = {
		isForceImpress = true,
		noAddHarm = true,
		skillID = 0,
		noAddEnergy = true,
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target
	}
	local buff = BuffManager:newBuff(params1)

	buff.isHit_ = true

	self:writeRecord(self.target, xyd.BUFF_REMOVE)
	unit:recordBuffs(self.target, {
		self
	})
	self.target:removeBuffs({
		self
	})

	return buff
end

return mayaBuffResistBuff
