-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/groupHpShieldBuff.lua

local groupHpShieldBuff = class("groupHpShieldBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function groupHpShieldBuff:ctor(params)
	groupHpShieldBuff.super.ctor(self, params)
end

function groupHpShieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function groupHpShieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function groupHpShieldBuff:excuteBuff(unit, recordBuffs)
	local groupM = 0

	for k, v in ipairs(self.fighter.selfTeam_) do
		for i = 2, #self.finalNumArray_ do
			if v:getGroup() == self.finalNumArray_[i] then
				groupM = groupM + 1

				break
			end
		end
	end

	if groupM > 0 then
		self.target:addHpShield(unit, groupM * self.finalNumArray_[1] * self.target:getHpLimit(), self.skillID, self.target)
	end
end

return groupHpShieldBuff
