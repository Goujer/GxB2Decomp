-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/attrBuffClearBuff.lua

local attrBuffClearBuff = class("attrBuffClearBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function attrBuffClearBuff:ctor(params)
	attrBuffClearBuff.super.ctor(self, params)
end

function attrBuffClearBuff:setIsHit()
	self:baseSetIsHit()
end

function attrBuffClearBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function attrBuffClearBuff:excuteBuff(unit, recordBuffs)
	local allBuffs = {}
	local needRemove = {}
	local buffNames = {}

	for _, buff in ipairs(self.target.buffs_) do
		local name_ = buff:getName()

		if buff:isAttrBuff() and buff:ifCanClean() then
			local actual_buff = buff:getActualBuff()

			if actual_buff ~= nil then
				if not allBuffs[actual_buff] then
					allBuffs[actual_buff] = {}

					table.insert(buffNames, actual_buff)
				end

				table.insert(allBuffs[actual_buff], buff)
			end
		end
	end

	if #buffNames > 0 then
		local selectIndexes = xyd.randomSelects(buffNames, 1)

		for _, selectIndex in ipairs(selectIndexes) do
			local selectDBuffs = allBuffs[selectIndex]

			if next(selectDBuffs) then
				for _, buff in ipairs(selectDBuffs) do
					self.target:cleanOneBuff(needRemove, recordBuffs, buff, unit)
				end
			end
		end
	end

	self.target:removeBuffs(needRemove, nil, unit)
end

return attrBuffClearBuff
