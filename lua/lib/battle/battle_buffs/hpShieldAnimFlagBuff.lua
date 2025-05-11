-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldAnimFlagBuff.lua

local hpShieldAnimFlagBuff = class("hpShieldAnimFlagBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldAnimFlagBuff:ctor(params)
	hpShieldAnimFlagBuff.super.ctor(self, params)
end

function hpShieldAnimFlagBuff:setIsHit(tmpBuffs)
	self.isHit_ = true
	self.target.hasHpShieldAnimFlag = true
end

function hpShieldAnimFlagBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hpShieldAnimFlagBuff:addAnim(unit)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)
end

function hpShieldAnimFlagBuff:clearAnim(unit)
	local buff2 = self.fighter:getOneBuffByName(xyd.BUFF_HP_SHIELD_ANIM)

	if buff2 then
		buff2:writeRecord(self.target, xyd.BUFF_REMOVE)
		unit:recordBuffs(self.target, {
			buff2
		})
		self.target:removeBuffs({
			buff2
		})
	end
end

return hpShieldAnimFlagBuff
