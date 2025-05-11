-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityVampireGambleTable.lua

local ActivityVampireGambleTable = class("ActivityVampireGambleTable", import("app.common.tables.BaseTable"))

function ActivityVampireGambleTable:ctor()
	ActivityVampireGambleTable.super.ctor(self, "activity_vampire_gamble")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityVampireGambleTable:getIDs()
	return self.ids
end

function ActivityVampireGambleTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityVampireGambleTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityVampireGambleTable:getBigAwardNum(id)
	return self:getNumber(id, "bigaward_show")
end

function ActivityVampireGambleTable:getUnlockProb(id)
	return self:getNumber(id, "prob")
end

return ActivityVampireGambleTable
