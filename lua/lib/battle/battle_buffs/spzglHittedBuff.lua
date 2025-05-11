-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/spzglHittedBuff.lua

local spzglHittedBuff = class("spzglHittedBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function spzglHittedBuff:ctor(params)
	spzglHittedBuff.super.ctor(self, params)
end

function spzglHittedBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function spzglHittedBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function spzglHittedBuff:hittedExcute(unit)
	local buffs = self.target:getBuffsByNameAndFighter(xyd.BUFF_SPZGL_HITTED)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID,
		forceEffectNum = EffectTable:num(self.finalNumArray_[1]) * #buffs
	}

	BuffManager:addNewBuff(params1, unit)

	if not self.fighter:isDeath() then
		local params2 = {
			effectID = self.finalNumArray_[2],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params2, unit, true)
	end

	for k, v in ipairs(buffs) do
		v:writeRecord(self.target, xyd.BUFF_REMOVE)
	end

	unit:recordBuffs(self.target, buffs)
	self.target:removeBuffs(buffs)
end

return spzglHittedBuff
