-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/clearDotBuff.lua

local clearDotBuff = class("clearDotBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function clearDotBuff:ctor(params)
	clearDotBuff.super.ctor(self, params)
end

function clearDotBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function clearDotBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function clearDotBuff:excuteBuff(unit, recordBuffs)
	local allBuffs = {}
	local needRemove = {}

	for _, buff in ipairs(self.target.buffs_) do
		local name_ = buff:getName()

		if buff:isRealDot() and buff:ifCanClean() then
			table.insert(allBuffs, buff)
		end
	end

	if #allBuffs > 0 then
		local selectIndexes = xyd.randomSelects(allBuffs, self.finalNumArray_[1])

		for _, buff in ipairs(selectIndexes) do
			self.target:cleanOneBuff(needRemove, recordBuffs, buff, unit)
		end

		self.target:removeBuffs(needRemove, nil, unit)
	end
end

return clearDotBuff
