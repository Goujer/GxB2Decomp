-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/yifuCombolBuff.lua

local yifuCombolBuff = class("yifuCombolBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function yifuCombolBuff:ctor(params)
	yifuCombolBuff.super.ctor(self, params)
end

function yifuCombolBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)

	self.recordEnergy = self.fighter:getEnergy()
end

function yifuCombolBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function yifuCombolBuff:excuteBuffAfterRecord(unit)
	if self.target:isDeath() then
		return
	end

	local maxNum = self.finalNumArray_[2]
	local markNum = #self.target:getBuffsByNameAndFighter(xyd.BUFF_YIFU_MARK)

	if maxNum < markNum then
		markNum = maxNum
	end

	table.insert(xyd.Battle.normalSkillTargets, self.target)

	for i = 1, markNum do
		local curUnit = self.fighter:useOneJumpSkill(nil, self.finalNumArray_[1], unit, true, false, true)

		if not curUnit then
			break
		end

		if self.target:isDeath() then
			break
		end
	end
end

return yifuCombolBuff
