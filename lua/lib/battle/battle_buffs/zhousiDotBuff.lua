-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/zhousiDotBuff.lua

local zhousiDotBuff = class("zhousiDotBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function zhousiDotBuff:ctor(params)
	zhousiDotBuff.super.ctor(self, params)
end

function zhousiDotBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function zhousiDotBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function zhousiDotBuff:excuteBuff(unit, recordBuffs)
	self:excuteBuffs(unit)
end

function zhousiDotBuff:excuteBuffs(unit)
	for i = 1, 3 do
		local params1 = {
			effectID = self.finalNumArray_[i],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit, true)
	end
end

function zhousiDotBuff:excuteAfterRound(unit)
	self:excuteBuffs(unit)
end

return zhousiDotBuff
