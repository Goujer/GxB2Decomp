-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpShieldBuff.lua

local hpShieldBuff = class("hpShieldBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpShieldBuff:ctor(params)
	hpShieldBuff.super.ctor(self, params)

	self.shieldValue = params.shieldValue
end

function hpShieldBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hpShieldBuff:calculateFinalNum(name, num, buffData, forceHurt)
	self:updateRecordshield(self.shieldValue)

	return 0
end

return hpShieldBuff
