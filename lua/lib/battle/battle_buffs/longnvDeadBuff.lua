-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/longnvDeadBuff.lua

local longnvDeadBuff = class("longnvDeadBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function longnvDeadBuff:ctor(params)
	longnvDeadBuff.super.ctor(self, params)
end

function longnvDeadBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function longnvDeadBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function longnvDeadBuff:afterReborn(unit)
	self:writeRecord(self.target, xyd.BUFF_REMOVE)
	unit:recordBuffs(self.target, {
		self
	})
	self.target:removeBuffs({
		self
	})
end

function longnvDeadBuff:addExtraJumpSkill(unit)
	local extraSkillID = self.finalNumArray_[3]
	local curUnit = self.fighter:useOneJumpPasSkill(nil, extraSkillID, unit, false, false, true)
	local posTeam = {}

	for k, v in ipairs(self.target.sideTeam_) do
		posTeam[v:getPos()] = v
	end

	local hasDeath = false

	for k, v in ipairs(unit:getTargetsRecord()) do
		if posTeam[v] and posTeam[v]:isDeath() then
			hasDeath = true

			break
		end
	end

	if hasDeath then
		local reviveBuff = self.fighter:getOneBuffByName(xyd.BUFF_REVIVE)

		if reviveBuff then
			reviveBuff.longnvBuff = self

			reviveBuff:setLeftCount(1)
		end
	end
end

return longnvDeadBuff
