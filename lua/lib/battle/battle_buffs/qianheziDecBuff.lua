-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/qianheziDecBuff.lua

local qianheziDecBuff = class("qianheziDecBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")
local GetTarget_ = xyd.Battle.getRequire("GetTarget")

function qianheziDecBuff:ctor(params)
	qianheziDecBuff.super.ctor(self, params)

	self.dmgValue = 0
	self.decTimes = 0
end

function qianheziDecBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function qianheziDecBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function qianheziDecBuff:recordHarmNum(unit, value)
	self.decTimes = self.decTimes + 1
	self.dmgValue = self.dmgValue + value

	if self.decTimes >= self.finalNumArray_[1] then
		self:writeRecord(self.target, xyd.BUFF_REMOVE)
		unit:recordBuffs(self.target, {
			self
		})
		self.target:removeBuffs({
			self
		}, nil, unit)
	end
end

function qianheziDecBuff:excuteBuff(unit, recordBuffs)
	for k, v in ipairs(self.target:getBuffsByNameAndFighter(xyd.BUFF_QIANHEZI_DEC)) do
		if v ~= self then
			v:writeRecord(v.target, xyd.BUFF_REMOVE)
			unit:recordBuffs(v.target, {
				v
			})
			v.target:removeBuffs({
				v
			}, nil, unit)
		end
	end
end

function qianheziDecBuff:excuteBuffByRemove(unit)
	if self.target:isDeath() and self.dmgValue >= 0 then
		return
	end

	self.target:addHpShield(unit, -self.dmgValue, self.skillID, self.target)

	self.dmgValue = 0
end

return qianheziDecBuff
