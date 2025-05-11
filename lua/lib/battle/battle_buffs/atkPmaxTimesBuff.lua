-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/atkPmaxTimesBuff.lua

local atkPmaxTimesBuff = class("atkPmaxTimesBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function atkPmaxTimesBuff:ctor(params)
	atkPmaxTimesBuff.super.ctor(self, params)
end

function atkPmaxTimesBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function atkPmaxTimesBuff:layerLimitAndCover(tmpBuffs)
	if not self.isHit_ then
		return
	end

	local name = self:getName()
	local buffs = self.target:getBuffsByNameAndFighter(name)
	local layerBuffs = {}

	for k, v in ipairs(buffs) do
		local layer = v.finalNumArray_[2]

		if not layerBuffs[layer] then
			layerBuffs[layer] = 0
		end

		layerBuffs[layer] = layerBuffs[layer] + 1
	end

	if layerBuffs[self.finalNumArray_[2]] and layerBuffs[self.finalNumArray_[2]] >= self.finalNumArray_[2] then
		self.isHit_ = false
	end
end

function atkPmaxTimesBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

return atkPmaxTimesBuff
