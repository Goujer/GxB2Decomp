-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/xierkediSkillBuff.lua

local xierkediSkillBuff = class("xierkediSkillBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function xierkediSkillBuff:ctor(params)
	xierkediSkillBuff.super.ctor(self, params)
end

function xierkediSkillBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	self.recordEnergy = self.fighter:getEnergy()
	self.fighter.xierkediSkillIndex = 0
end

function xierkediSkillBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function xierkediSkillBuff:excuteBuff(unit, recordBuffs, status)
	if not self.targetsNum then
		return
	end

	status.isHarm = true

	local index = 3

	if self.targetsNum == 2 then
		index = 2
	elseif self.targetsNum == 1 then
		index = 1
	end

	local targetHasSheild = self.target.shieldHp_ > 0
	local params1 = {
		effectID = self.finalNumArray_[index],
		fighter = self.fighter,
		target = self.target,
		recordEnergy = self.recordEnergy,
		skillID = self.skillID
	}

	BuffManager:addNewBuff(params1, unit)

	self.fighter.xierkediSkillIndex = self.fighter.xierkediSkillIndex + 1

	if not targetHasSheild then
		table.insert(xyd.Battle.specialNormalSkillTargets, self.target)
	end

	if self.fighter.xierkediSkillIndex + #unit.missBuffs == self.targetsNum then
		for i = 1, self.finalNumArray_[4] do
			local curUnit = self.fighter:useOneJumpSkill(nil, self.finalNumArray_[5], unit, true, false)

			if not curUnit then
				break
			end
		end
	end
end

return xierkediSkillBuff
