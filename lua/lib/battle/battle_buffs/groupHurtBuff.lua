-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/groupHurtBuff.lua

local groupHurtBuff = class("groupHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function groupHurtBuff:ctor(params)
	groupHurtBuff.super.ctor(self, params)
end

function groupHurtBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function groupHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local groupM = 0

	for k, v in ipairs(self.fighter.selfTeam_) do
		for i = 2, #self.finalNumArray_ do
			if v:getGroup() == self.finalNumArray_[i] then
				groupM = groupM + 1

				break
			end
		end
	end

	return -groupM * self.finalNumArray_[1]
end

function groupHurtBuff:excuteBuff(unit, recordBuffs)
	self:writeRecord(self.target, xyd.BUFF_WORK)
end

return groupHurtBuff
