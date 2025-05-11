-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/plmxsDebuffBuff.lua

local plmxsDebuffBuff = class("plmxsDebuffBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function plmxsDebuffBuff:ctor(params)
	plmxsDebuffBuff.super.ctor(self, params)
end

function plmxsDebuffBuff:setIsHit(tmpBuffs)
	self.needCoverCheck_ = true

	self:baseSetIsHit(nil, tmpBuffs)
end

function plmxsDebuffBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function plmxsDebuffBuff:checkCoverAddBuff(hitBuffs)
	local exBuff = self.fighter:getOneBuffByName(xyd.BUFF_PLMXS_TRANS)
	local decHurts = self.target:getBuffsByNameAndFighter(xyd.BUFF_DEC_HURT)
	local hasPlmxsHurt = false

	for k, v in ipairs(decHurts) do
		if v.isFromPlmxs then
			hasPlmxsHurt = true

			break
		end
	end

	if exBuff and not hasPlmxsHurt then
		local params1 = {
			effectID = exBuff.finalNumArray_[3],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}
		local newbuff = BuffManager:newBuff(params1)

		newbuff.isHit_ = true

		newbuff:calculate()

		newbuff.isFromPlmxs = true

		table.insert(hitBuffs, newbuff)
	end
end

return plmxsDebuffBuff
