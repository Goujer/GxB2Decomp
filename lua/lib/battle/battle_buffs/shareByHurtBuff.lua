-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/shareByHurtBuff.lua

local shareByHurtBuff = class("shareByHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function shareByHurtBuff:ctor(params)
	shareByHurtBuff.super.ctor(self, params)
end

function shareByHurtBuff:setIsHit()
	self:baseSetIsHit()
end

function shareByHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function shareByHurtBuff:removeSelf(unit)
	self:writeRecord(self.target, xyd.BUFF_REMOVE)
	unit:recordBuffs(self.target, {
		self
	})
	self.target:removeBuffs({
		self
	})
end

function shareByHurtBuff:shareHarm(unit, recordBuffs, harmNum, harmBuff)
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

	return harmNum - shareNum
end

return shareByHurtBuff
