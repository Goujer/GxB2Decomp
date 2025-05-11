-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/selfToTeamBuff.lua

local selfToTeamBuff = class("selfToTeamBuff", xyd.Battle.getRequire("ReportBuff"))
local GetTarget_ = xyd.Battle.getRequire("GetTarget")
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function selfToTeamBuff:ctor(params)
	selfToTeamBuff.super.ctor(self, params)
end

function selfToTeamBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function selfToTeamBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function selfToTeamBuff:excuteBuff(unit, recordBuffs)
	local selectTargets = GetTarget_.S2(self.target)

	for k, v in ipairs(selectTargets) do
		local params1 = {
			effectID = self.finalNumArray_[1],
			fighter = self.fighter,
			target = v,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit)
	end
end

return selfToTeamBuff
