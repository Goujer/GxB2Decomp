-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/dotAddHurtBuff.lua

local dotAddHurtBuff = class("dotAddHurtBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function dotAddHurtBuff:ctor(params)
	dotAddHurtBuff.super.ctor(self, params)
end

function dotAddHurtBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function dotAddHurtBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function dotAddHurtBuff:excuteBuff(unit, recordBuffs)
	local dotNum = 0

	for k, v in ipairs(self.target.buffs_) do
		if v:isRealDot() then
			dotNum = dotNum + 1

			local params1 = {
				effectID = self.finalNumArray_[1],
				fighter = self.fighter,
				target = self.target,
				skillID = self.skillID
			}

			BuffManager:addNewBuff(params1, unit)

			if dotNum >= self.finalNumArray_[2] then
				break
			end
		end
	end
end

return dotAddHurtBuff
