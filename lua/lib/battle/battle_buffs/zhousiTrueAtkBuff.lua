-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/zhousiTrueAtkBuff.lua

local zhousiTrueAtkBuff = class("zhousiTrueAtkBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")
local GetTarget_ = xyd.Battle.getRequire("GetTarget")

function zhousiTrueAtkBuff:ctor(params)
	zhousiTrueAtkBuff.super.ctor(self, params)
end

function zhousiTrueAtkBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function zhousiTrueAtkBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function zhousiTrueAtkBuff:excuteBuffAfterRecord(unit)
	local exBuff = self.target:getOneBuffByName(xyd.BUFF_ZHOUSI_TRUE_ATK_EX)

	if not exBuff then
		return
	end

	local buffs = self.target:getBuffsByNameAndFighter(xyd.BUFF_ZHOUSI_TRUE_ATK)

	if #buffs < 12 then
		return
	end

	for k, v in ipairs(buffs) do
		v:writeRecord(self.target, xyd.BUFF_REMOVE)
	end

	unit:recordBuffs(self.target, buffs)
	self.target:removeBuffs(buffs, nil, unit)

	local params1 = {
		effectID = exBuff.finalNumArray_[1],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)

	local targets = GetTarget_.S13(self.fighter)

	for k, v in ipairs(targets) do
		local params2 = {
			effectID = exBuff.finalNumArray_[2],
			fighter = self.fighter,
			target = v,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params2, unit)
	end
end

return zhousiTrueAtkBuff
