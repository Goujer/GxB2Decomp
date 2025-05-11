-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/seaBossDebuffHpShieldBuff.lua

local seaBossDebuffHpShieldBuff = class("seaBossDebuffHpShieldBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function seaBossDebuffHpShieldBuff:ctor(params)
	seaBossDebuffHpShieldBuff.super.ctor(self, params)
end

function seaBossDebuffHpShieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function seaBossDebuffHpShieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function seaBossDebuffHpShieldBuff:excuteBuff(unit, recordBuffs)
	local debuffNum = 0

	for k, v in ipairs(self.fighter.sideTeam_) do
		for k1, v1 in ipairs(v.buffs_) do
			if v1:isDebuff() then
				debuffNum = debuffNum + 1
			end
		end
	end

	local result = debuffNum * (self.finalNumArray_[1] + self.finalNumArray_[2] * (self.fighter.infRebornTimes_ + 1))

	self.target:addHpShield(unit, result, self.skillID, self.target)
end

return seaBossDebuffHpShieldBuff
