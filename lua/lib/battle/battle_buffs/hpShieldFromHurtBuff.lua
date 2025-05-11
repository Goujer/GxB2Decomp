-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldFromHurtBuff.lua

local hpShieldFromHurtBuff = class("hpShieldFromHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldFromHurtBuff:ctor(params)
	hpShieldFromHurtBuff.super.ctor(self, params)
end

function hpShieldFromHurtBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldFromHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local lastBuff = xyd.Battle.lastHurtBuff

	if lastBuff and self.target == lastBuff.target and self.skillID == lastBuff.skillID and self.fighter == lastBuff.fighter then
		self.lastHurtNum = lastBuff.recordNum_ or lastBuff:getFinalNum() or 0
	else
		self.lastHurtNum = 0
	end

	return 0
end

function hpShieldFromHurtBuff:excuteBuff(unit, recordBuffs)
	local lastBuff = xyd.Battle.lastHurtBuff

	if self.lastHurtNum ~= 0 then
		self.fighter:addHpShield(unit, -self.lastHurtNum * self.finalNumArray_[1], self.skillID, self.fighter, true)
	end
end

return hpShieldFromHurtBuff
