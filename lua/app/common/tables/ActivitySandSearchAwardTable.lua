-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySandSearchAwardTable.lua

local ActivitySandSearchAwardTable = class("ActivitySandSearchAwardTable", import("app.common.tables.BaseTable"))

function ActivitySandSearchAwardTable:ctor()
	ActivitySandSearchAwardTable.super.ctor(self, "activity_sand_award")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySandSearchAwardTable:getIds()
	return self.ids_
end

function ActivitySandSearchAwardTable:getPointStage()
	local params = {}

	for i = 1, 3 do
		params[i] = self:getPoint(1, i)
	end

	return params
end

function ActivitySandSearchAwardTable:getPoint(id, index)
	return self:getNumber(id, "point" .. index)
end

function ActivitySandSearchAwardTable:getAward(id, index)
	return self:split2Cost(id, "award" .. index, "#", true)
end

return ActivitySandSearchAwardTable
