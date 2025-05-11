-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/immediatelyBuff.lua

local immediatelyBuff = class("immediatelyBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function immediatelyBuff:ctor(params)
	immediatelyBuff.super.ctor(self, params)
end

function immediatelyBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function immediatelyBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function immediatelyBuff:excuteBuff(unit, recordBuffs)
	local params1 = {
		noRecord = true,
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff1 = BuffManager:addNewBuff(params1, unit, true)

	buff1.noAdd = true
	buff1.noRecord = false

	table.insert(recordBuffs, buff1)
end

return immediatelyBuff
