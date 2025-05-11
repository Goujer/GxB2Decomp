-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/deathLayerBuff.lua

local deathLayerBuff = class("deathLayerBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function deathLayerBuff:ctor(params)
	deathLayerBuff.super.ctor(self, params)
end

function deathLayerBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function deathLayerBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function deathLayerBuff:calculateAD()
	if #self.target:getBuffsByNameAndFighter(xyd.BUFF_DEATH_LAYER_MARK) >= 3 then
		return -self.finalNumArray_[1]
	else
		return 0
	end
end

function deathLayerBuff:excuteAfterRound(unit)
	local marks = self.target:getBuffsByNameAndFighter(xyd.BUFF_DEATH_LAYER_MARK)

	if #marks >= 5 then
		local params1 = {
			effectID = self.finalNumArray_[2],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit, true)
	end

	if #marks >= 15 then
		local params1 = {
			effectID = self.finalNumArray_[3],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit, true)
	end
end

return deathLayerBuff
