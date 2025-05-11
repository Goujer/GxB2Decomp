-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/aifeiSealHurtBuff.lua

local aifeiSealHurtBuff = class("aifeiSealHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local GetTarget_ = xyd.Battle.getRequire("GetTarget")
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function aifeiSealHurtBuff:ctor(params)
	aifeiSealHurtBuff.super.ctor(self, params)
end

function aifeiSealHurtBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function aifeiSealHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function aifeiSealHurtBuff:excuteBuff(unit, recordBuffs)
	local countBuff = self.target:getOneBuffByName(xyd.BUFF_AIFEI_COUNT_SEAL)

	if not countBuff then
		return
	end

	local leftCount = 0

	for k, v in ipairs(self.target.sideTeam_) do
		if v:getOneBuffByName(xyd.BUFF_SOUL_SEAL) then
			leftCount = leftCount + 1
		end
	end

	local times = countBuff:getFinalNum() - leftCount

	if times > 1 then
		times = 1
	end

	local alives = GetTarget_.S13(self.target)

	for i = 1, times do
		for k, v in ipairs(alives) do
			local params1 = {
				effectID = self.finalNumArray_[1],
				fighter = self.fighter,
				target = v,
				skillID = self.skillID
			}

			BuffManager:addNewBuff(params1, unit)
		end
	end
end

return aifeiSealHurtBuff
