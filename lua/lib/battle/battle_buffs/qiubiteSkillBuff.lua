-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/qiubiteSkillBuff.lua

local qiubiteSkillBuff = class("qiubiteSkillBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function qiubiteSkillBuff:ctor(params)
	qiubiteSkillBuff.super.ctor(self, params)
end

function qiubiteSkillBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function qiubiteSkillBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function qiubiteSkillBuff:excuteBuff(unit, recordBuffs)
	local qiubiteMarks = self.fighter:getBuffsByNameAndFighter(xyd.BUFF_QIUBITE_MARK)

	for i = 1, #qiubiteMarks do
		local params1 = {
			effectID = self.finalNumArray_[1],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit)
	end
end

return qiubiteSkillBuff
