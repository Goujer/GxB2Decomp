-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/abcCopyBuff.lua

local abcCopyBuff = class("abcCopyBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function abcCopyBuff:ctor(params)
	abcCopyBuff.super.ctor(self, params)
end

function abcCopyBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function abcCopyBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return self.finalNumArray_[1]
end

function abcCopyBuff:excuteBuff(unit, recordBuffs)
	return
end

function abcCopyBuff:excuteAfterRound(unit)
	return
end

return abcCopyBuff
