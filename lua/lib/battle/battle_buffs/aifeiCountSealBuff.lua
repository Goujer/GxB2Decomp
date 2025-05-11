-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/aifeiCountSealBuff.lua

local aifeiCountSealBuff = class("aifeiCountSealBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function aifeiCountSealBuff:ctor(params)
	aifeiCountSealBuff.super.ctor(self, params)
end

function aifeiCountSealBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function aifeiCountSealBuff:calculateFinalNum(name, num, buffData, forceHurt)
	local result = 0

	for k, v in ipairs(self.target.sideTeam_) do
		if v:getOneBuffByName(xyd.BUFF_SOUL_SEAL) then
			result = result + 1
		end
	end

	return result
end

return aifeiCountSealBuff
