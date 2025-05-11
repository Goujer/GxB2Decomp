-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/nextPugongColor3Buff.lua

local nextPugongColor3Buff = class("nextPugongColor3Buff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function nextPugongColor3Buff:ctor(params)
	nextPugongColor3Buff.super.ctor(self, params)
end

function nextPugongColor3Buff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function nextPugongColor3Buff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function nextPugongColor3Buff:pugongTrigger(unit)
	local buffs = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_ROUND3)
	local maxRoundBuff
	local needRemoveBuffs = {
		self
	}

	for k, v in ipairs(buffs) do
		if not maxRoundBuff then
			maxRoundBuff = v
		elseif v:getCount() > maxRoundBuff:getCount() then
			maxRoundBuff = v
		end
	end

	for k, v in ipairs(buffs) do
		if v ~= maxRoundBuff then
			table.insert(needRemoveBuffs, v)
		end
	end

	for i = 1, #needRemoveBuffs do
		needRemoveBuffs[i]:writeRecord(needRemoveBuffs[i].target, xyd.BUFF_REMOVE)
	end

	self:writeRecord(self.target, xyd.BUFF_REMOVE)
	unit:recordBuffs(self.target, needRemoveBuffs)
	self.target:removeBuffs(needRemoveBuffs)

	if next(xyd.Battle.puGongNormalSkillTargets) then
		local params1 = {
			effectID = self.finalNumArray_[1],
			fighter = self.fighter,
			target = xyd.Battle.puGongNormalSkillTargets[1],
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit)
	end
end

return nextPugongColor3Buff
