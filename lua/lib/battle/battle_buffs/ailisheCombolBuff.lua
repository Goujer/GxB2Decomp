-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ailisheCombolBuff.lua

local ailisheCombolBuff = class("ailisheCombolBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function ailisheCombolBuff:ctor(params)
	ailisheCombolBuff.super.ctor(self, params)
end

function ailisheCombolBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	self.recordEnergy = self.fighter:getEnergy()
	self.fighter.ailisheSkillIndex = 0
end

function ailisheCombolBuff:calculateFinalNum(name, num, buffData, forceHurt)
	self.target.ailisheColorMarkNum = 0

	local buffs1 = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_COLOR1)
	local buffs2 = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_COLOR2)
	local buffs3 = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_COLOR3)

	if next(buffs1) then
		self.target.ailisheColorMarkNum = self.target.ailisheColorMarkNum + 1
	end

	if next(buffs2) then
		self.target.ailisheColorMarkNum = self.target.ailisheColorMarkNum + 1
	end

	if next(buffs3) then
		self.target.ailisheColorMarkNum = self.target.ailisheColorMarkNum + 1
	end

	return 0
end

function ailisheCombolBuff:excuteBuffAfterRecord(unit)
	self.fighter.ailisheSkillIndex = self.fighter.ailisheSkillIndex + 1

	table.insert(xyd.Battle.specialNormalSkillTargets, self.target)

	if self.fighter.ailisheSkillIndex + #unit.missBuffs == self.targetsNum then
		local allTargets = {}

		for k, v in ipairs(xyd.Battle.specialNormalSkillTargets) do
			table.insert(allTargets, v)
		end

		for i = 1, 3 do
			xyd.Battle.specialNormalSkillTargets = {}

			for k, v in ipairs(allTargets) do
				if not v:isDeath() and i <= v.ailisheColorMarkNum then
					table.insert(xyd.Battle.specialNormalSkillTargets, v)
				end
			end

			if #xyd.Battle.specialNormalSkillTargets > 0 then
				local curUnit = self.fighter:useOneJumpSkill(nil, self.finalNumArray_[1], unit, true, false, true)

				if not curUnit then
					break
				end
			end
		end
	end
end

return ailisheCombolBuff
