-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/groupDmgUpBuff.lua

local groupDmgUpBuff = class("groupDmgUpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function groupDmgUpBuff:ctor(params)
	groupDmgUpBuff.super.ctor(self, params)
end

function groupDmgUpBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function groupDmgUpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function groupDmgUpBuff:calculateUpRate()
	local addTimes = 0
	local groups = {}

	for k, v in ipairs(self.target.selfTeam_) do
		local group = v:getGroup()

		if not groups[group] then
			groups[group] = true
			addTimes = addTimes + 1
		end
	end

	return addTimes * self.finalNumArray_[1]
end

return groupDmgUpBuff
