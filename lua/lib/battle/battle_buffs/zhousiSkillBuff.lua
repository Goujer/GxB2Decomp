-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/zhousiSkillBuff.lua

local zhousiSkillBuff = class("zhousiSkillBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function zhousiSkillBuff:ctor(params)
	zhousiSkillBuff.super.ctor(self, params)
end

function zhousiSkillBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function zhousiSkillBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function zhousiSkillBuff:excuteBuff(unit, recordBuffs)
	local zhousiDots = {}
	local lives = 0

	for k, v in ipairs(self.fighter.sideTeam_) do
		if not v:isDeath() then
			local dot = v:getOneBuffByName(xyd.BUFF_ZHOUSI_DOT)

			if dot then
				table.insert(zhousiDots, dot)
			end

			lives = lives + 1
		end
	end

	for k, v in ipairs(zhousiDots) do
		v:excuteBuffs(unit)
	end

	if lives > #zhousiDots then
		for i = 1, self.finalNumArray_[1] do
			local params1 = {
				effectID = self.finalNumArray_[2],
				fighter = self.fighter,
				target = self.fighter,
				skillID = self.skillID
			}

			BuffManager:addNewBuff(params1, unit)
		end
	end
end

return zhousiSkillBuff
