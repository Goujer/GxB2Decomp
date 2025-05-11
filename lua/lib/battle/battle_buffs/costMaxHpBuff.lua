-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/costMaxHpBuff.lua

local costMaxHpBuff = class("costMaxHpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function costMaxHpBuff:ctor(params)
	costMaxHpBuff.super.ctor(self, params)
end

function costMaxHpBuff:setIsHit()
	self.isHit_ = self.target:isDeath() == false
end

function costMaxHpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = math.floor(self.finalNumArray_[1] * self.target:getHpLimit())

	return -finalNum
end

function costMaxHpBuff:excuteBuff(unit, recordBuffs)
	local hp = self.target:getHp() + self.finalNum_

	if hp <= 0 then
		hp = 0
	end

	self.target:updateHp(hp)
	self:writeRecord(self.target, xyd.BUFF_WORK)
	self.target:checkSelfDie(unit, self)
end

return costMaxHpBuff
