-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/xierkediDotCheckBuff.lua

local xierkediDotCheckBuff = class("xierkediDotCheckBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function xierkediDotCheckBuff:ctor(params)
	xierkediDotCheckBuff.super.ctor(self, params)
end

function xierkediDotCheckBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function xierkediDotCheckBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function xierkediDotCheckBuff:excuteBuff(unit, recordBuffs)
	if next(self.target:getBuffsByNameAndFighter(xyd.BUFF_XIERKEDI_DOT)) then
		for i = 1, self.finalNumArray_[1] do
			local params1 = {
				noAddEnergy = true,
				effectID = self.finalNumArray_[2],
				fighter = self.fighter,
				target = self.target,
				skillID = self.skillID
			}

			BuffManager:addNewBuff(params1, unit)
		end
	else
		local params1 = {
			effectID = self.finalNumArray_[3],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit)
	end
end

return xierkediDotCheckBuff
