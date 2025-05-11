-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hurtMaxHpLimitBBuff.lua

local hurtMaxHpLimitBBuff = class("hurtMaxHpLimitBBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hurtMaxHpLimitBBuff:ctor(params)
	hurtMaxHpLimitBBuff.super.ctor(self, params)

	self.roundUseTimes = 0
	self.roundRecord = xyd.Battle.round
end

function hurtMaxHpLimitBBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hurtMaxHpLimitBBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function hurtMaxHpLimitBBuff:calculateResult(result, target)
	local hurtMaxHpLimitBBuffs = target:getBuffsByNameAndFighter(xyd.BUFF_HURT_MAX_HP_LIMIT_B)
	local preUseBuff

	for k, v in ipairs(hurtMaxHpLimitBBuffs) do
		if v.roundRecord ~= xyd.Battle.round then
			v.roundUseTimes = 0
		end

		v.roundRecord = xyd.Battle.round

		local canUse = false

		if #v.finalNumArray_ == 1 then
			canUse = true
		elseif v.roundUseTimes < v.finalNumArray_[2] then
			canUse = true
		end

		if canUse and (not preUseBuff or preUseBuff.finalNumArray_[1] < v.finalNumArray_[1]) then
			preUseBuff = v
		end
	end

	if not preUseBuff then
		return result
	end

	local tmpRate = preUseBuff:getFinalNum()

	if target:getHpLimit() * tmpRate < -result then
		if -target:getHpLimit() * tmpRate - result > target:getHpLimit() then
			result = result + target:getHpLimit()
		else
			result = -target:getHpLimit() * tmpRate
		end

		if #preUseBuff.finalNumArray_ >= 2 then
			preUseBuff.roundUseTimes = preUseBuff.roundUseTimes + 1
		end
	end

	result = math.min(0, result)

	return result
end

return hurtMaxHpLimitBBuff
