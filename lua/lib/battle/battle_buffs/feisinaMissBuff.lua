-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/feisinaMissBuff.lua

local feisinaMissBuff = class("feisinaMissBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable

function feisinaMissBuff:ctor(params)
	feisinaMissBuff.super.ctor(self, params)
end

function feisinaMissBuff:setIsHit()
	local hasBuff = false

	if self.target:getOneBuffByName(xyd.BUFF_FEISINA_MISS) then
		hasBuff = true
	end

	self:baseSetIsHit()

	if hasBuff and self:isHit() then
		local buffs = self.target:getBuffsByNameAndFighter(xyd.BUFF_FEISINA_MISS)

		if self:getCount() > buffs[1]:getCount() then
			buffs[1].leftCount_ = self:getCount()
		end

		self.isHit_ = false
	end
end

function feisinaMissBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return EffectTable:num(self.effectID)
end

return feisinaMissBuff
