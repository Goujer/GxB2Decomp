-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/mixColorBuff.lua

local mixColorBuff = class("mixColorBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function mixColorBuff:ctor(params)
	mixColorBuff.super.ctor(self, params)
end

function mixColorBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function mixColorBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function mixColorBuff:excuteBuff(unit, recordBuffs)
	local buffs1 = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_COLOR1)
	local buffs2 = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_COLOR2)
	local buffs3 = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_COLOR3)
	local productBuffIndex = 0

	if next(buffs1) and next(buffs2) and next(buffs3) then
		productBuffIndex = 4
	elseif next(buffs1) and next(buffs2) then
		productBuffIndex = 1
	elseif next(buffs2) and next(buffs3) then
		productBuffIndex = 3
	elseif next(buffs1) and next(buffs3) then
		productBuffIndex = 2
	end

	if productBuffIndex > 0 then
		local params1 = {
			effectID = self.finalNumArray_[productBuffIndex],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		BuffManager:addNewBuff(params1, unit)
	end

	for _, mBuff in ipairs(buffs1) do
		mBuff:writeRecord(mBuff.target, xyd.BUFF_REMOVE)
		table.insert(recordBuffs, mBuff)
	end

	for _, mBuff in ipairs(buffs2) do
		mBuff:writeRecord(mBuff.target, xyd.BUFF_REMOVE)
		table.insert(recordBuffs, mBuff)
	end

	for _, mBuff in ipairs(buffs3) do
		mBuff:writeRecord(mBuff.target, xyd.BUFF_REMOVE)
		table.insert(recordBuffs, mBuff)
	end

	self.target:removeBuffs(buffs1)
	self.target:removeBuffs(buffs2)
	self.target:removeBuffs(buffs3)
end

return mixColorBuff
