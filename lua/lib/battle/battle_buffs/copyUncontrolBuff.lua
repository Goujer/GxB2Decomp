-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_buffs/copyUncontrolBuff.lua

local copyUncontrolBuff = class("copyUncontrolBuff", xyd.Battle.getRequire("ReportBuff"))
local EffectTable = xyd.tables.effectTable
local BuffTable = xyd.tables.dBuffTable
local SkillTable = xyd.tables.skillTable
local GetTarget_ = xyd.Battle.getRequire("GetTarget")

function copyUncontrolBuff:ctor(params)
	copyUncontrolBuff.super.ctor(self, params)
end

function copyUncontrolBuff:setIsHit(tmpBuffs)
	self:baseSetIsHit(nil, tmpBuffs)
end

function copyUncontrolBuff:calculateFinalNum(name, num, buffData, forceHurt)
	return 0
end

function copyUncontrolBuff:excuteBuff(unit, recordBuffs)
	local removeBuffLists = {}
	local uncontrolBuffs, allNames = self.target:getUnControlBuffs()

	if not next(uncontrolBuffs) then
		return
	end

	local selectTargets = GetTarget_.S18(self.target, 1)

	if not next(selectTargets) then
		return
	end

	if selectTargets[1]:getOneBuffByName(xyd.BUFF_XIERKEDI_POWER) then
		unit:recordTargets(selectTargets[1], true, false, false, {}, {}, false, 1)

		return
	end

	local selectNames = xyd.randomSelects(allNames, 1)
	local sName = selectNames[1]

	if not sName then
		return
	end

	if sName then
		local buffs = uncontrolBuffs[sName]

		if next(buffs) then
			local num = 0
			local sTarget = selectTargets[1]

			for _, buff in ipairs(buffs) do
				if xyd.weightedChoise({
					self.finalNumArray_[1],
					1 - self.finalNumArray_[1]
				}) == 1 then
					buff:writeRecord(self.target, xyd.BUFF_REMOVE)
					table.insert(recordBuffs, buff)
					table.insert(removeBuffLists, buff)
				end

				if buff:isCanDebuffSame() and sTarget and not buff.isCopy then
					local newBuff = xyd.copyBuff(buff, sTarget, buff.fighter, 1)

					if newBuff:isHit() then
						newBuff:changeBuffName()
						newBuff:setEndLoop(true)

						newBuff.isCopy = true

						sTarget:addBuffs({
							newBuff
						}, unit)
						sTarget:delSpecialBuffCount(newBuff)

						if newBuff:getCount() > 0 then
							newBuff:writeRecord(sTarget, xyd.BUFF_ON_WORK)
							table.insert(recordBuffs, newBuff)
						end
					end
				end
			end
		end
	end

	self.target:removeBuffs(removeBuffLists)
end

return copyUncontrolBuff
