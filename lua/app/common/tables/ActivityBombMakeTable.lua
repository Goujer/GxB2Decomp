-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBombMakeTable.lua

local ActivityBombMakeTable = class("ActivityBombMakeTable", import("app.common.tables.BaseTable"))

function ActivityBombMakeTable:ctor()
	ActivityBombMakeTable.super.ctor(self, "activity_bomb_make")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)

	self.totalWeight = 0

	for id in pairs(self.ids) do
		self.totalWeight = self.totalWeight + self:getNumber(id, "weight")
	end
end

function ActivityBombMakeTable:getIds()
	return self.ids
end

function ActivityBombMakeTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityBombMakeTable:getProbability(id)
	return self:getNumber(id, "weight") / self.totalWeight
end

return ActivityBombMakeTable
