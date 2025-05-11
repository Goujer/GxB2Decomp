-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDriftAwardTable.lua

local ActivityDriftAwardTable = class("ActivityDriftAwardTable", import("app.common.tables.BaseTable"))

function ActivityDriftAwardTable:ctor()
	ActivityDriftAwardTable.super.ctor(self, "activity_lafuli_award")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityDriftAwardTable:getIDs()
	return self.ids
end

function ActivityDriftAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityDriftAwardTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityDriftAwardTable:getNextID(point)
	point = point % self:getNumber(self.ids[#self.ids], "point")

	for i = 1, #self.ids do
		if point < self:getNumber(self.ids[i], "point") then
			return self.ids[i]
		end
	end

	return nil
end

return ActivityDriftAwardTable
