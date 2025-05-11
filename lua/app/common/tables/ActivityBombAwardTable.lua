-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBombAwardTable.lua

local ActivityBombAwardTable = class("ActivityBombAwardTable", import("app.common.tables.BaseTable"))

function ActivityBombAwardTable:ctor()
	ActivityBombAwardTable.super.ctor(self, "activity_bomb_award")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityBombAwardTable:getIds()
	return self.ids
end

function ActivityBombAwardTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityBombAwardTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityBombAwardTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityBombAwardTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityBombAwardTable
