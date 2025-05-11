-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/targetDmgUpBuff.lua

local targetDmgUpBuff = class("targetDmgUpBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function targetDmgUpBuff:ctor(params)
	targetDmgUpBuff.super.ctor(self, params)
end

function targetDmgUpBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function targetDmgUpBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function targetDmgUpBuff:getHarmRate(unit)
	local records = unit:getTargetsRecord()
	local addNum = 0

	for k, v in ipairs(records) do
		if self.target:getPos() <= 6 then
			if v > 6 and v <= 12 then
				addNum = addNum + 1
			end
		elseif v <= 6 then
			addNum = addNum + 1
		end
	end

	return addNum * self.finalNumArray_[1]
end

return targetDmgUpBuff
