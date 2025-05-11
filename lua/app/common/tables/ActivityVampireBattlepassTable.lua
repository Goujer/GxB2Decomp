-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityVampireBattlepassTable.lua

local ActivityVampireBattlepassTable = class("ActivityVampireBattlepassTable", import("app.common.tables.BaseTable"))

function ActivityVampireBattlepassTable:ctor()
	ActivityVampireBattlepassTable.super.ctor(self, "activity_vampire_battlepass")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityVampireBattlepassTable:getIDs()
	return self.ids_
end

function ActivityVampireBattlepassTable:getCostTotal(id)
	return self:getNumber(id, "cost_total")
end

function ActivityVampireBattlepassTable:getCostExp(id)
	return self:split2Cost(id, "cost_exp", "#")
end

function ActivityVampireBattlepassTable:getFreeAward(id)
	return self:split2Cost(id, "free_award", "|#")
end

function ActivityVampireBattlepassTable:getPaidAward(id)
	return self:split2Cost(id, "paid_award", "|#")
end

function ActivityVampireBattlepassTable:getLev(num)
	local lev = 0

	for i, id in pairs(self.ids_) do
		if num >= self:getCostTotal(id) then
			lev = id
		else
			break
		end
	end

	return lev
end

return ActivityVampireBattlepassTable
