-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterBattleTable.lua

local TimeCloisterBattleTable = class("TimeCloisterBattleTable", import("app.common.tables.BaseTable"))

function TimeCloisterBattleTable:ctor()
	TimeCloisterBattleTable.super.ctor(self, "time_cloister_battle")

	self.idsByCloister = {}

	for id, _ in pairs(self.TableLua.rows) do
		local cloister = self:getCloister(id)

		if not self.idsByCloister[cloister] then
			self.idsByCloister[cloister] = {}
		end

		table.insert(self.idsByCloister[cloister], tonumber(id))
	end

	for _, list in ipairs(self.idsByCloister) do
		table.sort(list)
	end
end

function TimeCloisterBattleTable:getIdsByCloister(cloister)
	return self.idsByCloister[cloister]
end

function TimeCloisterBattleTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function TimeCloisterBattleTable:getIsFirst(id)
	return self:getNumber(id, "fort_first") or 0
end

function TimeCloisterBattleTable:getCloister(id)
	return self:getNumber(id, "cloister")
end

function TimeCloisterBattleTable:getType(id)
	return self:getNumber(id, "type")
end

function TimeCloisterBattleTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function TimeCloisterBattleTable:getSkillIds(id)
	return self:split2Cost(id, "skill_ids", "#")
end

function TimeCloisterBattleTable:getBase(id)
	return self:split2Cost(id, "base", "|")
end

function TimeCloisterBattleTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function TimeCloisterBattleTable:getTec(id)
	return self:split2Cost(id, "tec", "#")
end

function TimeCloisterBattleTable:getName(id)
	return xyd.tables.timeCloisterBattleTextTable:getName(id)
end

function TimeCloisterBattleTable:getDesc(id)
	return xyd.tables.timeCloisterBattleTextTable:getDesc(id)
end

return TimeCloisterBattleTable
