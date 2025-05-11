-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/lianhuaBloodHurtBuff.lua

local lianhuaBloodHurtBuff = class("lianhuaBloodHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function lianhuaBloodHurtBuff:ctor(params)
	lianhuaBloodHurtBuff.super.ctor(self, params)
end

function lianhuaBloodHurtBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function lianhuaBloodHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function lianhuaBloodHurtBuff:blooded(unit, harmBuff)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = harmBuff.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)
end

return lianhuaBloodHurtBuff
