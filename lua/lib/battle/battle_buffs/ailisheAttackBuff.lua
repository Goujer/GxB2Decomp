-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ailisheAttackBuff.lua

local ailisheAttackBuff = class("ailisheAttackBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function ailisheAttackBuff:ctor(params)
	ailisheAttackBuff.super.ctor(self, params)
end

function ailisheAttackBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function ailisheAttackBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function ailisheAttackBuff:excuteBuff(unit, recordBuffs)
	if not self.target:getOneBuffByName(xyd.BUFF_AILISHE_COLOR1) and not self.target:getOneBuffByName(xyd.BUFF_AILISHE_COLOR2) and not self.target:getOneBuffByName(xyd.BUFF_AILISHE_COLOR3) then
		return
	end

	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)

	local index = 3

	if self.target:getEnergy() >= 100 then
		index = 2
	end

	local params2 = {
		effectID = self.finalNumArray_[index],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff = BuffManager:addNewBuff(params2, unit, true)

	if xyd.Battle.round > 1 then
		buff.leftCount_ = buff.leftCount_ + 1
	end
end

return ailisheAttackBuff
