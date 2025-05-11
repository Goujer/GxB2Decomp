-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/yifuCleanControlBuff.lua

local yifuCleanControlBuff = class("yifuCleanControlBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")
local GetTarget_ = xyd.Battle.getRequire("GetTarget")

function yifuCleanControlBuff:ctor(params)
	yifuCleanControlBuff.super.ctor(self, params)
end

function yifuCleanControlBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function yifuCleanControlBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function yifuCleanControlBuff:excuteBuff(unit, recordBuffs)
	local params1 = {
		effectID = self.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)

	local selectTargets = GetTarget_.S18(self.target, 1)

	if not next(selectTargets) then
		return
	end

	local enemyTarget = selectTargets[1]
	local params2 = {
		effectID = self.finalNumArray_[2],
		fighter = self.fighter,
		target = enemyTarget,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params2, unit)
end

return yifuCleanControlBuff
