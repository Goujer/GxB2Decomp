-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/longnvPosPowerBuff.lua

local longnvPosPowerBuff = class("longnvPosPowerBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function longnvPosPowerBuff:ctor(params)
	longnvPosPowerBuff.super.ctor(self, params)
end

function longnvPosPowerBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function longnvPosPowerBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function longnvPosPowerBuff:excuteBuff(unit, recordBuffs)
	for k, v in ipairs(self.target.selfTeam_) do
		if self.target:isBackTarget() then
			if v:isBackTarget() then
				local params1 = {
					effectID = self.finalNumArray_[2],
					fighter = self.fighter,
					target = v,
					skillID = self.skillID
				}

				BuffManager:addNewBuff(params1, unit)
			end
		elseif not v:isBackTarget() then
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

return longnvPosPowerBuff
