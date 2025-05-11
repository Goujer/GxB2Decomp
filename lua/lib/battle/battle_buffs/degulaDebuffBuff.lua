-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/degulaDebuffBuff.lua

local degulaDebuffBuff = class("degulaDebuffBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function degulaDebuffBuff:ctor(params)
	degulaDebuffBuff.super.ctor(self, params)

	self.addRate = 0
end

function degulaDebuffBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	self.hasCountBuff = #self.fighter:getBuffsByNameAndFighter(xyd.BUFF_DEGULA_COUNT) ~= 0
end

function degulaDebuffBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function degulaDebuffBuff:excuteBuff(unit, recordBuffs)
	local buff2s = self.fighter:getBuffsByNameAndFighter(xyd.BUFF_DEGULA_COUNT)

	if self.hasCountBuff and next(buff2s) then
		local buff2 = buff2s[1]

		self.addRate = buff2.finalNumArray_[1]

		buff2:writeRecord(self.fighter, xyd.BUFF_REMOVE)
		unit:recordBuffs(self.fighter, {
			buff2
		})
		self.fighter:removeBuffs({
			buff2
		})
	end

	self:excuteEffect(unit, recordBuffs)
end

function degulaDebuffBuff:excuteAfterRound(unit)
	self:excuteEffect(unit)
end

function degulaDebuffBuff:isDot()
	return true
end

function degulaDebuffBuff:needWorkAndOn()
	return true
end

function degulaDebuffBuff:excuteEffect(unit, recordBuffs)
	local noRecord = false

	if recordBuffs then
		noRecord = true
	end

	local forceEffectNum = EffectTable:num(self.finalNumArray_[1])

	if not noRecord then
		forceEffectNum = forceEffectNum * self.target:getDotChangeRate(self.fighter)
	end

	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID,
		specialValue = self.addRate,
		forceEffectNum = forceEffectNum
	}
	local buff1 = BuffManager:newBuff(params1)

	buff1.isHit_ = true

	buff1:calculate()

	local harm, cure = params1.target:applyBuffHarm(unit, {
		buff1
	}, noRecord)

	params1.fighter:recordData(harm, cure)

	local params1 = {
		effectID = self.finalNumArray_[2],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID,
		specialValue = self.addRate
	}
	local buff2 = BuffManager:addNewBuff(params1, unit, false, noRecord)

	if noRecord then
		table.insert(recordBuffs, buff1)
		table.insert(recordBuffs, buff2)
	end

	local params2 = {
		effectID = self.finalNumArray_[3],
		fighter = self.fighter,
		target = self.fighter,
		skillID = self.skillID
	}
	local siphonBuff = BuffManager:newBuff(params2)

	siphonBuff.isHit_ = true
	siphonBuff.basicHarm_ = -buff1:getFinalNum()

	siphonBuff:calculate()

	local harm, cure = self.fighter:applyBuffHarm(unit, {
		siphonBuff
	})

	self.fighter:recordData(harm, cure)
end

return degulaDebuffBuff
