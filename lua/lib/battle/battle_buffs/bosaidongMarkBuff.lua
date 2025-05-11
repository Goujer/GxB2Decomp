-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/bosaidongMarkBuff.lua

local bosaidongMarkBuff = class("bosaidongMarkBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffManager = xyd.Battle.getRequire("BuffManager")

function bosaidongMarkBuff:ctor(params)
	bosaidongMarkBuff.super.ctor(self, params)
end

function bosaidongMarkBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function bosaidongMarkBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function bosaidongMarkBuff:needWorkAndOn()
	return true
end

function bosaidongMarkBuff:excuteBuffAfterRecord(unit)
	local marks = self.target:getBuffsByNameAndFighter(xyd.BUFF_BOSAIDONG_MARK)

	if #marks >= 6 then
		for k, v in ipairs(marks) do
			v:writeRecord(self.target, xyd.BUFF_REMOVE)
		end

		unit:recordBuffs(self.target, marks)
		self.target:removeBuffs(marks, nil, unit)

		for i = 3, 4 do
			local params1 = {
				effectID = self.finalNumArray_[i],
				fighter = self.fighter,
				target = self.target,
				skillID = self.skillID
			}

			BuffManager:addNewBuff(params1, unit, true)
		end

		for k, v in ipairs(self.target.selfTeam_) do
			if not v:isDeath() and v ~= self.target then
				for i = 1, 2 do
					local params1 = {
						effectID = self.finalNumArray_[i],
						fighter = self.fighter,
						target = v,
						skillID = self.skillID
					}

					BuffManager:addNewBuff(params1, unit, true)
				end
			end
		end
	end
end

return bosaidongMarkBuff
