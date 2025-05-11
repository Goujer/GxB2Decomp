-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/harmShareOnceBuff.lua

local harmShareOnceBuff = class("harmShareOnceBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function harmShareOnceBuff:ctor(params)
	harmShareOnceBuff.super.ctor(self, params)
end

function harmShareOnceBuff:setIsHit()
	self:baseSetIsHit()
end

function harmShareOnceBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function harmShareOnceBuff:excuteAfterRound(unit)
	self:writeRecord(self.target, xyd.BUFF_OFF)
	unit:recordBuffs(self.target, {
		self
	})
end

function harmShareOnceBuff:shareHarm(unit, recordBuffs, harmNum, harmBuff)
	if self.target == self.fighter then
		return harmNum
	end

	local shareNum = harmNum * self.finalNumArray_[1]
	local params = {
		target = self.fighter,
		fighter = harmBuff.fighter
	}
	local buff = BuffManager:newBuff(params)

	buff.isHit_ = true
	buff.name_ = xyd.BUFF_HURT_SHARE
	buff.preName_ = xyd.BUFF_HURT_SHARE
	buff.finalNum_ = shareNum

	params.target:harmShareCalculate(unit, {
		buff
	})
	self.target:removeBuffs({
		self
	})
	self:writeRecord(self.target, xyd.BUFF_REMOVE)
	table.insert(recordBuffs, self)

	return harmNum - shareNum
end

return harmShareOnceBuff
