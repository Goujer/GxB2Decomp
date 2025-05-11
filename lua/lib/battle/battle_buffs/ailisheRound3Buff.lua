-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/ailisheRound3Buff.lua

local ailisheRound3Buff = class("ailisheRound3Buff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")
local GetTarget_ = xyd.Battle.getRequire("GetTarget")

function ailisheRound3Buff:ctor(params)
	ailisheRound3Buff.super.ctor(self, params)
end

function ailisheRound3Buff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function ailisheRound3Buff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function ailisheRound3Buff:excuteBuff(unit, recordBuffs)
	local buffs = self.target:getBuffsByNameAndFighter(xyd.BUFF_AILISHE_ROUND3)

	if #buffs >= 2 then
		local targets = GetTarget_.S18(self.fighter, 2)

		for k, v in ipairs(targets) do
			local params1 = {
				effectID = self.finalNumArray_[3],
				fighter = self.fighter,
				target = v,
				skillID = self.skillID
			}

			BuffManager:addNewBuff(params1, unit)
		end

		for i = 1, #buffs do
			buffs[i]:writeRecord(buffs[i].target, xyd.BUFF_REMOVE)
		end

		unit:recordBuffs(self.target, buffs)
		self.target:removeBuffs(buffs)
	end
end

return ailisheRound3Buff
