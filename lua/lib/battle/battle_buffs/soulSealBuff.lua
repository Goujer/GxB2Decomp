-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/soulSealBuff.lua

local soulSealBuff = class("soulSealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")
local GetTarget_ = xyd.Battle.getRequire("GetTarget")

function soulSealBuff:ctor(params)
	soulSealBuff.super.ctor(self, params)

	self.recordHealNum = 0
end

function soulSealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	local hasBuffNum = 0

	for k, v in ipairs(self.target.selfTeam_) do
		if not v:isDeath() and v:getOneBuffByName(xyd.BUFF_SOUL_SEAL) then
			hasBuffNum = hasBuffNum + 1
		end
	end

	if hasBuffNum >= 4 then
		self.isHit_ = false
	end
end

function soulSealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function soulSealBuff:excuteAfterRound(unit)
	local markBuff = self.fighter:getOneBuffByName(xyd.BUFF_AIFEI_MARK)

	if not markBuff then
		return
	end

	local targets = {}

	table.insert(targets, self.target)

	local alives = GetTarget_.S11(self.target)

	if next(alives) then
		local friend = xyd.randomSelects(alives, 1)[1]

		table.insert(targets, friend)
	end

	for k, v in ipairs(targets) do
		local finalNum = v:getHpLimit() * markBuff.finalNumArray_[1]

		if finalNum > self.fighter:getAD() * markBuff.finalNumArray_[2] then
			finalNum = self.fighter:getAD() * markBuff.finalNumArray_[2]
		end

		local params1 = {
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}
		local buff1 = BuffManager:newBuff(params1)

		buff1.name_ = xyd.BUFF_DIRECT_HURT
		buff1.isHit_ = true
		buff1.finalNum_ = -finalNum

		params1.target:applyBuffHarm(unit, {
			buff1
		}, false, true)
	end
end

function soulSealBuff:addRecordHeal(result)
	self.recordHealNum = self.recordHealNum + result * self.finalNumArray_[1]
end

function soulSealBuff:hitted(unit)
	local finalNum = self.fighter:getHpLimit() * self.finalNumArray_[2]

	if finalNum > self.fighter:getAD() * self.finalNumArray_[3] then
		finalNum = self.fighter:getAD() * self.finalNumArray_[3]
	end

	local params1 = {
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff1 = BuffManager:newBuff(params1)

	buff1.name_ = xyd.BUFF_DIRECT_HURT
	buff1.isHit_ = true
	buff1.finalNum_ = -finalNum

	params1.target:applyBuffHarm(unit, {
		buff1
	}, false, true)
end

function soulSealBuff:excuteBuffByRemove(unit)
	local healBuff = BuffManager:newBuff({
		isCopy = true,
		skillID = self.skillID,
		target = self.target,
		fighter = self.target,
		forceEffectNum = self.recordHealNum
	})

	healBuff.name_ = xyd.BUFF_DIRECT_HEAL

	local num = healBuff.forceEffectNum

	num = num * healBuff.target:getExtraHealRate()
	num = healBuff.target:blockHeal(num, unit, healBuff)

	healBuff.target:updateHpByHeal(num, unit, true)
	healBuff:setRecordNum(num)
	healBuff.fighter:recordData(0, num)
	healBuff:writeRecord(healBuff.target, xyd.BUFF_WORK)
	unit:recordPasBuffs(healBuff.target, {
		healBuff
	})
end

return soulSealBuff
