-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityVampireGrowTable.lua

local ActivityVampireGrowTable = class("ActivityVampireGrowTable", import("app.common.tables.BaseTable"))

function ActivityVampireGrowTable:ctor()
	ActivityVampireGrowTable.super.ctor(self, "activity_vampire_grow")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityVampireGrowTable:getIDs()
	return self.ids
end

function ActivityVampireGrowTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityVampireGrowTable:getPoint(id)
	return self:getNumber(id, "num")
end

return ActivityVampireGrowTable
