-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/aifeiCombolBuff.lua

local aifeiCombolBuff = class("aifeiCombolBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function aifeiCombolBuff:ctor(params)
	aifeiCombolBuff.super.ctor(self, params)
end

function aifeiCombolBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function aifeiCombolBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function aifeiCombolBuff:excuteBuff(unit, recordBuffs)
	local times = self.finalNumArray_[2] + (xyd.Battle.round - 1)

	if times > self.finalNumArray_[3] then
		times = self.finalNumArray_[3]
	end

	for i = 1, times do
		local params1 = {
			effectID = self.finalNumArray_[1],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit)
	end
end

return aifeiCombolBuff
