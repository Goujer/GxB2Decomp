-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/dmgRateSpreadBuff.lua

local dmgRateSpreadBuff = class("dmgRateSpreadBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")
local battle_event = require("lib.battle.battle_event")

function dmgRateSpreadBuff:ctor(params)
	dmgRateSpreadBuff.super.ctor(self, params)
end

function dmgRateSpreadBuff:setIsHit()
	self.isHit_ = true
end

function dmgRateSpreadBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

local function dieEffect(unit, dieTarget)
	local dieTargetBuffs = dieTarget:getBuffsByNameAndFighter(xyd.BUFF_DEATH_MARK)

	if #dieTargetBuffs == 0 then
		return
	end

	for _, v in ipairs(dieTarget.selfTeam_) do
		if not v:isDeath() and v ~= dieTarget and not v:isExile() then
			local params1 = {
				target = v,
				fighter = dieTargetBuffs[1].fighter,
				effectID = dieTargetBuffs[1].effectID,
				skillID = dieTargetBuffs[1].skillID
			}
			local displayBuff1 = BuffManager:newBuff(params1)

			displayBuff1.isHit_ = true

			displayBuff1:calculate()
			v:applyBuffHarm(unit, {
				displayBuff1
			})
		end
	end

	dieTargetBuffs[1]:writeRecord(dieTargetBuffs[1].target, xyd.BUFF_REMOVE)
	unit:recordBuffs(dieTargetBuffs[1].target, {
		dieTargetBuffs[1]
	})
	dieTargetBuffs[1].target:removeBuffs({
		dieTargetBuffs[1]
	})
end

function dmgRateSpreadBuff:reg_evt()
	local evt = battle_event:instance()

	evt:on(xyd.BATTLE_EVENT_DIE, dieEffect)
end

return dmgRateSpreadBuff
