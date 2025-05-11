-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/hittedHarderBuff.lua

local hittedHarderBuff = class("hittedHarderBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function hittedHarderBuff:ctor(params)
	hittedHarderBuff.super.ctor(self, params)

	self.addFreeHarm = 0
end

function hittedHarderBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function hittedHarderBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function hittedHarderBuff:hitted()
	self.addFreeHarm = self.addFreeHarm + self.finalNumArray_[1]
end

function hittedHarderBuff:clearHitted()
	self.addFreeHarm = 0
end

return hittedHarderBuff
