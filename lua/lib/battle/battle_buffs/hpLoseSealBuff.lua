-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hpLoseSealBuff.lua

local hpLoseSealBuff = class("hpLoseSealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hpLoseSealBuff:ctor(params)
	hpLoseSealBuff.super.ctor(self, params)
end

function hpLoseSealBuff:setIsHit()
	self:baseSetIsHit()

	if self:isHit() then
		self.loseHp = self.target:getHpLimit() - self.target:getHp()
	end
end

function hpLoseSealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

return hpLoseSealBuff
