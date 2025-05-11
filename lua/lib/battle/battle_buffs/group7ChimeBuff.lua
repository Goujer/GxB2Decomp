-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/group7ChimeBuff.lua

local group7ChimeBuff = class("group7ChimeBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function group7ChimeBuff:ctor(params)
	group7ChimeBuff.super.ctor(self, params)
end

function group7ChimeBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function group7ChimeBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function group7ChimeBuff:excuteBuff(unit, recordBuffs)
	local group7Num = 0

	for k, v in ipairs(self.target.selfTeam_) do
		if v:getGroup() == 7 then
			group7Num = group7Num + 1
		end
	end

	for i = 1, group7Num do
		local params1 = {
			noRecord = true,
			effectID = self.finalNumArray_[i],
			fighter = self.fighter,
			target = self.target,
			skillID = self.skillID
		}

		for k = 1, group7Num do
			local buff = BuffManager:addNewBuff(params1, unit)

			buff:setYongJiu(true)
		end
	end

	if group7Num > 0 then
		self.target:updateInitHp()
	end
end

return group7ChimeBuff
