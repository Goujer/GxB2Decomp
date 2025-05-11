-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterTecTable.lua

local TimeCloisterTecTable = class("TimeCloisterTecTable", import("app.common.tables.BaseTable"))

function TimeCloisterTecTable:ctor()
	TimeCloisterTecTable.super.ctor(self, "time_cloister_tec")

	self.idsByCloister = {}

	for id, _ in pairs(self.TableLua.rows) do
		local cloister = self:getCloister(id)
		local group = self:getGroup(id)

		if not self.idsByCloister[cloister] then
			self.idsByCloister[cloister] = {}
		end

		if not self.idsByCloister[cloister][group] then
			self.idsByCloister[cloister][group] = {}
		end

		table.insert(self.idsByCloister[cloister][group], tonumber(id))
	end

	for _, list in ipairs(self.idsByCloister) do
		for _, l in ipairs(list) do
			table.sort(l)
		end
	end
end

function TimeCloisterTecTable:getIdsByCloister(cloister)
	return self.idsByCloister[cloister]
end

function TimeCloisterTecTable:getPreId(id)
	return self:split2Cost(id, "pre_id", "|")
end

function TimeCloisterTecTable:getPreLv(id)
	return self:split2Cost(id, "pre_lv", "|")
end

function TimeCloisterTecTable:getMaxLv(id)
	return self:getNumber(id, "max_lvl")
end

function TimeCloisterTecTable:getCloister(id)
	return self:getNumber(id, "cloister")
end

function TimeCloisterTecTable:getGroup(id)
	return self:getNumber(id, "group")
end

function TimeCloisterTecTable:getUnlockType(id)
	return self:getNumber(id, "unlock_type") or 0
end

function TimeCloisterTecTable:getUnlockNum(id)
	return self:split2Cost(id, "unlock_num", "|")
end

function TimeCloisterTecTable:getType(id)
	return self:getNumber(id, "type")
end

function TimeCloisterTecTable:getNum(id)
	return self:split2Cost(id, "num", "|")
end

function TimeCloisterTecTable:getUpgradeCost(id)
	return self:split2Cost(id, "upgrade_cost", "|#")
end

function TimeCloisterTecTable:getUpgradeCostSpecial(id)
	return self:split2Cost(id, "upgrade_cost", "|@#")
end

function TimeCloisterTecTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function TimeCloisterTecTable:getPos(id)
	return self:split2Cost(id, "xy", "|")
end

function TimeCloisterTecTable:getImg(id)
	return self:getString(id, "img")
end

function TimeCloisterTecTable:getRank(id)
	return self:getNumber(id, "rank") or 0
end

return TimeCloisterTecTable
