-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeChessTable.lua

local PartnerChallengeChessTable = class("PartnerChallengeChessTable", import(".PartnerChallengeTable"))

function PartnerChallengeChessTable:ctor()
	PartnerChallengeChessTable.super.ctor(self, "partner_challenge_chess")

	self.ids = {}
	self.battleTarget = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, self:Number(id))

		self.battleTarget[self:getBattleId(self:Number(id))] = self:getBattleTarget(self:Number(id))
	end

	table.sort(self.ids)

	for k, v in pairs(self.fortIds) do
		if self:getFortType(k) ~= 3 then
			self.fortIds[k] = nil
		end
	end
end

function PartnerChallengeChessTable:getReward2(id)
	return self:getNumber(id, "reward2")
end

function PartnerChallengeChessTable:getFortType(fortId)
	local ids = self:getIdsByFort(fortId)

	return self:getNumber(ids[1], "type")
end

function PartnerChallengeChessTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function PartnerChallengeChessTable:getBattleTarget(id)
	return self:getNumber(id, "battle_target") or 0
end

function PartnerChallengeChessTable:getBattleBuff(id)
	return self:split2num(id, "battle_buff", "|") or {}
end

function PartnerChallengeChessTable:fortName(id)
	return xyd.tables.partnerChallengeChessTextTable:fortName(id)
end

function PartnerChallengeChessTable:fortName2(id)
	return xyd.tables.partnerChallengeChessTextTable:fortName2(id)
end

function PartnerChallengeChessTable:name(id)
	return xyd.tables.partnerChallengeChessTextTable:name(id)
end

function PartnerChallengeChessTable:isFirst(id)
	return self:getNumber(id, "fort_first") == 1
end

function PartnerChallengeChessTable:getSkillDesc(id)
	return xyd.tables.partnerChallengeChessTextTable:getSkillDesc(id)
end

function PartnerChallengeChessTable:description(id)
	return xyd.tables.partnerChallengeChessTextTable:description(id)
end

function PartnerChallengeChessTable:getFirstStageId(stage_id)
	for i = stage_id, 1, -1 do
		local id = self.ids[i]

		if self:isFirst(id) then
			return id
		end
	end

	return stage_id
end

function PartnerChallengeChessTable:getIsFirst(id)
	return self:getNumber(id, "fort_first")
end

function PartnerChallengeChessTable:getPageNum()
	local num = 0

	for _, id in ipairs(self.ids) do
		if self:getIsFirst(id) == 1 then
			num = num + 1
		end
	end

	return num
end

function PartnerChallengeChessTable:getTargetByBattleId(battleId)
	return self.battleTarget[battleId]
end

return PartnerChallengeChessTable
