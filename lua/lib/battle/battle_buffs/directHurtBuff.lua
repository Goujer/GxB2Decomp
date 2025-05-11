-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/directHurtBuff.lua

local directHurtBuff = class("directHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function directHurtBuff:ctor(params)
	directHurtBuff.super.ctor(self, params)
end

function directHurtBuff:setIsHit()
	self:baseSetIsHit()
end

function directHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return -num
end

return directHurtBuff
