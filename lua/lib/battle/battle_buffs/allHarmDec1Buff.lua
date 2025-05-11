-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/allHarmDec1Buff.lua

local allHarmDec1Buff = class("allHarmDec1Buff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function allHarmDec1Buff:ctor(params)
	allHarmDec1Buff.super.ctor(self, params)
end

function allHarmDec1Buff:setIsHit(tmpBuffs)
	self:changeBuffName()
	self:baseSetIsHit(nil, tmpBuffs)

	local buffs = self.target:getBuffsByNameAndFighter(xyd.BUFF_ALL_HARM_DEC)

	for k, v in ipairs(buffs) do
		if v.effectID == self.effectID and v.leftCount_ == EffectTable:round(self.effectID) then
			self.isHit_ = false

			break
		end
	end
end

return allHarmDec1Buff
