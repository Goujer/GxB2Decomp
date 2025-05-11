-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/lianhuaHittedHealBuff.lua

local lianhuaHittedHealBuff = class("lianhuaHittedHealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function lianhuaHittedHealBuff:ctor(params)
	lianhuaHittedHealBuff.super.ctor(self, params)
end

function lianhuaHittedHealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function lianhuaHittedHealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function lianhuaHittedHealBuff:hitted(unit, harm, harmBuff, buffFighter)
	if not buffFighter or harm >= 0 then
		return
	end

	if harmBuff then
		if harmBuff:getName() == xyd.BUFF_REAL_HURT or harmBuff.isCopy then
			return
		end
	else
		return
	end

	if buffFighter:getTeamType() == self.target:getTeamType() then
		return
	end

	if not buffFighter:isDotBlood() then
		return
	end

	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)

	local params2 = {
		effectID = self.finalNumArray_[2],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params2, unit)
end

return lianhuaHittedHealBuff
