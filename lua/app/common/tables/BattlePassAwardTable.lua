-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattlePassAwardTable.lua

local BattlePassAwardTable = class("BattlePassAwardTable", import("app.common.tables.BaseTable"))

function BattlePassAwardTable:ctor()
	BattlePassAwardTable.super.ctor(self, "battlepass_award")

	self.ids_ = {}
	self.maxId_ = 0

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		if not self.maxId_ or self.maxId_ < tonumber(id) then
			self.maxId_ = tonumber(id)
		end
	end

	table.sort(self.ids_)
end

function BattlePassAwardTable:getMaxId()
	return self.maxId_
end

function BattlePassAwardTable:getLevByExp(exp)
	for _, theId in ipairs(self.ids_) do
		if exp < self:getCostTotal(theId) then
			return theId - 1
		end
	end

	return self:getMaxId()
end

function BattlePassAwardTable:getIds()
	return self.ids_
end

function BattlePassAwardTable:getCostTotal(id)
	return self:getNumber(id, "cost_total")
end

function BattlePassAwardTable:getCostExp(id)
	return self:split2num(id, "cost_bpexp", "#")
end

function BattlePassAwardTable:getCostDiamonds(id)
	return self:split2num(id, "cost_diamonds", "#")
end

function BattlePassAwardTable:getCostDctDiamonds(id)
	return self:split2num(id, "cost_dct_diamonds", "#")
end

function BattlePassAwardTable:getFreeAward(id)
	return self:split2Cost(id, "free_award", "|#")
end

function BattlePassAwardTable:getPaidAward(id)
	return self:split2Cost(id, "paid_award", "|#")
end

function BattlePassAwardTable:getIsBigReward(id)
	return self:getNumber(id, "is_bigreward") == 1
end

return BattlePassAwardTable
