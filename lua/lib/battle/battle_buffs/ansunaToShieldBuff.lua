-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ansunaToShieldBuff.lua

local ansunaToShieldBuff = class("ansunaToShieldBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function ansunaToShieldBuff:ctor(params)
	ansunaToShieldBuff.super.ctor(self, params)
end

function ansunaToShieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function ansunaToShieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function ansunaToShieldBuff:hitted(unit, harm, harmBuff, buffFighter)
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

	if buffFighter:getTeamType() == self.fighter:getTeamType() then
		return
	end

	self.fighter:addHpShield(unit, -harm * self.finalNumArray_[2], self.skillID, self.fighter)

	harmBuff.shield = math.ceil(self.fighter.shieldHp_ / self.fighter:getHpLimit() * 100)
end

return ansunaToShieldBuff
