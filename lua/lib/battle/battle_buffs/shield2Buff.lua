-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/shield2Buff.lua

local shield2Buff = class("shield2Buff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function shield2Buff:ctor(params)
	shield2Buff.super.ctor(self, params)
end

function shield2Buff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
	self:changeBuffName()
end

function shield2Buff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function shield2Buff:checkLeftTimes(unit)
	self.finalNum_ = self.finalNum_ - 1

	if self.finalNum_ <= 0 then
		self.target:removeBuffs({
			self
		})
		self:writeRecord(self.target, xyd.BUFF_OFF)
	else
		self:writeRecord(self.target, xyd.BUFF_WORK)
	end

	unit:recordPasBuffs(nil, {
		self
	})
end

return shield2Buff
