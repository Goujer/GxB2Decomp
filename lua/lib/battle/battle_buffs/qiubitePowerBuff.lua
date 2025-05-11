-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/qiubitePowerBuff.lua

local qiubitePowerBuff = class("qiubitePowerBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function qiubitePowerBuff:ctor(params)
	qiubitePowerBuff.super.ctor(self, params)
end

function qiubitePowerBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function qiubitePowerBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function qiubitePowerBuff:excuteBuffByHeal(unit, value)
	if value > 0 then
		self.target:addHpShield(unit, value, self.skillID, self.target)
	end
end

return qiubitePowerBuff
