-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLovePointTable.lua

local ActivityLovePointTable = class("ActivityLovePointTable", import("app.common.tables.BaseTable"))

function ActivityLovePointTable:ctor()
	ActivityLovePointTable.super.ctor(self, "activity_love_point")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityLovePointTable:getIDs()
	return self.ids_
end

function ActivityLovePointTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityLovePointTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityLovePointTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityLovePointTable
