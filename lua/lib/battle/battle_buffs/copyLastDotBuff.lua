-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/copyLastDotBuff.lua

local copyLastDotBuff = class("copyLastDotBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function copyLastDotBuff:ctor(params)
	copyLastDotBuff.super.ctor(self, params)
end

function copyLastDotBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function copyLastDotBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function copyLastDotBuff:excuteBuff(unit, recordBuffs, status)
	local buff_ = self.fighter.lastAddDot

	if not buff_ or buff_.isCopy then
		return
	end

	local params = {
		effectID = buff_.effectID,
		fighter = buff_.fighter,
		target = self.target,
		skillID = self.skillID
	}
	local buff = BuffManager:newBuff(params)

	buff.isCopy = true
	buff.isHit_ = true

	buff:calculate()
	self.target:recordBuffStatus(status, buff)
	self.target:applyBuffHarm(unit, {
		buff
	})

	if self.finalNumArray_[1] and self.finalNumArray_[1] ~= 0 then
		local params2 = {
			effectID = self.finalNumArray_[1],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}
		local buff = BuffManager:addNewBuff(params2, unit)
	end
end

return copyLastDotBuff
