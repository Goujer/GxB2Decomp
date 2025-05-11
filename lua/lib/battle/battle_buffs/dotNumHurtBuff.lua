-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/dotNumHurtBuff.lua

local dotNumHurtBuff = class("dotNumHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function dotNumHurtBuff:ctor(params)
	dotNumHurtBuff.super.ctor(self, params)
end

function dotNumHurtBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function dotNumHurtBuff:calculate()
	local name = self:getName()
	local num = EffectTable:num(self.effectID)
	local dotBuffs = self.target.isDot_

	num = num * #dotBuffs
	self.finalNum_ = self:calculateFinalNum(name, num, false)
end

function dotNumHurtBuff:excuteBuff(unit, recordBuffs)
	self:writeRecord(self.target, xyd.BUFF_WORK)
end

return dotNumHurtBuff
