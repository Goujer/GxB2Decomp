-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/qiubiteHealBuff.lua

local qiubiteHealBuff = class("qiubiteHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function qiubiteHealBuff:ctor(params)
	qiubiteHealBuff.super.ctor(self, params)
end

function qiubiteHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function qiubiteHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local finalNum = self.finalNumArray_[1] * self.fighter:getAD() * #self.fighter:getBuffsByNameAndFighter(xyd.BUFF_QIUBITE_MARK)

	finalNum = self:updateHealNum(finalNum)

	return finalNum
end

function qiubiteHealBuff:excuteBuff(unit, recordBuffs)
	local qiubiteMarks = self.fighter:getBuffsByNameAndFighter(xyd.BUFF_QIUBITE_MARK)
	local marksNum = #qiubiteMarks

	if next(qiubiteMarks) then
		for k, v in ipairs(qiubiteMarks) do
			v:writeRecord(self.fighter, xyd.BUFF_REMOVE, true)
		end

		unit:recordPasBuffs(self.fighter, qiubiteMarks)
		self.fighter:removeBuffs(qiubiteMarks, nil, unit)

		for k, v in ipairs(self.fighter.selfTeam_) do
			if not v:isDeath() then
				local addShieldNum = self.fighter:getHpLimit() * qiubiteMarks[1].finalNumArray_[1]

				if v:getHp() < v:getHpLimit() / 2 then
					addShieldNum = addShieldNum + self.fighter:getHpLimit() * qiubiteMarks[1].finalNumArray_[2]
				end

				v:addHpShield(unit, addShieldNum, self.skillID, self.fighter)
			end
		end
	end
end

function qiubiteHealBuff:isHeal()
	return true
end

return qiubiteHealBuff
