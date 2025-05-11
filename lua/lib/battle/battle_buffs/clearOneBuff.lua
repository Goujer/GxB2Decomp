-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/clearOneBuff.lua

local clearOneBuff = class("clearOneBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function clearOneBuff:ctor(params)
	clearOneBuff.super.ctor(self, params)
end

function clearOneBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function clearOneBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function clearOneBuff:excuteBuff(unit, recordBuffs)
	local name_ = EffectTable:buff(self.finalNumArray_[1])
	local buffs = self.target:getBuffsByNameAndFighter(name_)

	if next(buffs) then
		for k, v in ipairs(buffs) do
			v:writeRecord(self.target, xyd.BUFF_REMOVE)
		end

		unit:recordBuffs(self.target, buffs)
		self.target:removeBuffs(buffs, nil, unit)
	end
end

return clearOneBuff
