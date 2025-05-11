-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ownShieldBuff.lua

local ownShieldBuff = class("ownShieldBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function ownShieldBuff:ctor(params)
	ownShieldBuff.super.ctor(self, params)
end

function ownShieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function ownShieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function ownShieldBuff:excuteBuff(unit, recordBuffs)
	if self.target.shieldHp_ <= 0 then
		return
	end

	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)
end

return ownShieldBuff
