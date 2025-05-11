-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ansunaPugongBuff.lua

local ansunaPugongBuff = class("ansunaPugongBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function ansunaPugongBuff:ctor(params)
	ansunaPugongBuff.super.ctor(self, params)
end

function ansunaPugongBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function ansunaPugongBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function ansunaPugongBuff:excuteBuff(unit, recordBuffs)
	if self.target:getOneBuffByName(xyd.BUFF_ANSUNA_TO_SHIELD) then
		for i = 1, self.finalNumArray_[2] do
			local params1 = {
				effectID = self.finalNumArray_[3],
				fighter = self.fighter,
				target = self.target,
				skillID = self.skillID
			}

			BuffManager:addNewBuff(params1, unit)
		end
	else
		local params1 = {
			effectID = self.finalNumArray_[1],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit)
	end
end

return ansunaPugongBuff
