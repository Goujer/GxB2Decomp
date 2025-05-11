-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/xierkediDotBuff.lua

local xierkediDotBuff = class("xierkediDotBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function xierkediDotBuff:ctor(params)
	xierkediDotBuff.super.ctor(self, params)
end

function xierkediDotBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	local buffNum = 0

	for _, v in ipairs(self.fighter.sideTeam_) do
		if next(v:getBuffsByNameAndFighter(xyd.BUFF_XIERKEDI_DOT)) then
			buffNum = buffNum + 1
		end
	end

	if buffNum >= 3 then
		self.isHit_ = false
	end
end

function xierkediDotBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function xierkediDotBuff:excuteAfterRound(unit)
	local params1 = {
		effectID = self.finalNumArray_[2],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)

	local params2 = {
		effectID = self.finalNumArray_[3],
		fighter = self.fighter,
		target = self.target,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params2, unit)
end

return xierkediDotBuff
