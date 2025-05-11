-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/deathBuff.lua

local deathBuff = class("deathBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function deathBuff:ctor(params)
	deathBuff.super.ctor(self, params)
end

function deathBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function deathBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.target:getHpLimit()
end

function deathBuff:excuteBuff(unit, recordBuffs)
	self.target:updateHp(0)
	self.target:checkSelfDie(unit, self)
end

return deathBuff
