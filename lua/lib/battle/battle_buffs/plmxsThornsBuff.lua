-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/plmxsThornsBuff.lua

local plmxsThornsBuff = class("plmxsThornsBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function plmxsThornsBuff:ctor(params)
	plmxsThornsBuff.super.ctor(self, params)

	self.isTrans = false
end

function plmxsThornsBuff:setIsHit(tmpBuffs)
	self.needCoverCheck_ = true

	if self.fighter:getOneBuffByName(xyd.BUFF_PLMXS_TRANS) then
		self.isTrans = true
	end

	self:baseSetIsHit(nil, tmpBuffs)

	if not self.isTrans and self.fighter == self.target and not self.fighter:isBackTarget() then
		self.isHit_ = false
	end
end

function plmxsThornsBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function plmxsThornsBuff:hitted(unit, harm, harmBuff, buffFighter)
	if not buffFighter then
		return
	end

	if harmBuff and (harmBuff:getName() == xyd.BUFF_REAL_HURT or harmBuff:getName() == xyd.BUFF_PLMXS_THORNS_HURT or harmBuff.isCopy) then
		return
	end

	if buffFighter:getTeamType() == self.target:getTeamType() or buffFighter:isPet() or buffFighter:isGod() then
		return
	end

	local effectNum = harm * self.finalNumArray_[2]
	local params1 = {
		effectID = 1570001,
		onlyForceEffectNum = true,
		isCopy = true,
		fighter = self.target,
		target = buffFighter,
		skillID = self.skillID,
		forceEffectNum = effectNum
	}
	local newBuff = BuffManager:addNewBuff(params1, unit)
end

function plmxsThornsBuff:getJianshang()
	local result = self.finalNumArray_[1]

	if self.isTrans and self.fighter == self.target then
		local transBuff = self.fighter:getOneBuffByName(xyd.BUFF_PLMXS_TRANS)

		if transBuff then
			result = result * transBuff.finalNumArray_[2]
		end
	end

	return result
end

function plmxsThornsBuff:checkCoverAddBuff(hitBuffs)
	local exBuff = self.fighter:getOneBuffByName(xyd.BUFF_PLMXS_TRANS)
	local decHurts = self.target:getBuffsByNameAndFighter(xyd.BUFF_ALL_HARM_DEC)
	local hasPlmxsHurt = false

	for k, v in ipairs(decHurts) do
		if v.isFromPlmxs then
			hasPlmxsHurt = true

			break
		end
	end

	if exBuff and not hasPlmxsHurt then
		local params1 = {
			effectID = exBuff.finalNumArray_[1],
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

return plmxsThornsBuff
