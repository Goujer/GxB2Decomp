-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hurt3AllDmgBuff.lua

local hurt3AllDmgBuff = class("hurt3AllDmgBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hurt3AllDmgBuff:ctor(params)
	hurt3AllDmgBuff.super.ctor(self, params)

	self.hurtTimes = 0
end

function hurt3AllDmgBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hurt3AllDmgBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hurt3AllDmgBuff:addTimes()
	self.hurtTimes = self.hurtTimes + 1

	if self.hurtTimes >= 4 then
		self.hurtTimes = 0
	end
end

function hurt3AllDmgBuff:getDmgAdd()
	if self.hurtTimes == 3 then
		return self.finalNumArray_[1]
	end

	return 0
end

return hurt3AllDmgBuff
