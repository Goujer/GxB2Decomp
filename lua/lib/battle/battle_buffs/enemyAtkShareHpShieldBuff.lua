-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/enemyAtkShareHpShieldBuff.lua

local enemyAtkShareHpShieldBuff = class("enemyAtkShareHpShieldBuff", xyd.Battle.getRequire("ReportBuff"))
local GetTarget_ = xyd.Battle.getRequire("GetTarget")
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function enemyAtkShareHpShieldBuff:ctor(params)
	enemyAtkShareHpShieldBuff.super.ctor(self, params)
end

function enemyAtkShareHpShieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function enemyAtkShareHpShieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function enemyAtkShareHpShieldBuff:excuteBuff(unit, recordBuffs)
	local selectTargets = GetTarget_.S76(self.target, 1)

	if not next(selectTargets) then
		return
	end

	local enemyTargets = {}

	for k, v in ipairs(self.target.sideTeam_) do
		if not v:isDeath() then
			table.insert(enemyTargets, v)
		end
	end

	if not next(enemyTargets) then
		return
	end

	local everyShield = selectTargets[1]:getAD() * self.finalNumArray_[1] / #enemyTargets * 100

	for k, v in ipairs(enemyTargets) do
		v:addHpShield(unit, everyShield, self.skillID, self.fighter)
	end
end

return enemyAtkShareHpShieldBuff
