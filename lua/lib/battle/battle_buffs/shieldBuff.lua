-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/shieldBuff.lua

local shieldBuff = class("shieldBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function shieldBuff:ctor(params)
	shieldBuff.super.ctor(self, params)
end

function shieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function shieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function shieldBuff:checkLeftTimes(unit)
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

return shieldBuff
