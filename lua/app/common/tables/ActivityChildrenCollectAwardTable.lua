-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChildrenCollectAwardTable.lua

local ActivityChildrenCollectAwardTable = class("ActivityChildrenCollectAwardTable", import("app.common.tables.BaseTable"))

function ActivityChildrenCollectAwardTable:ctor()
	ActivityChildrenCollectAwardTable.super.ctor(self, "activity_children_collect_award")

	self.ids_ = {}
	self.maxPoint_ = 0

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local point = self:getPoint(id)

		if point > self.maxPoint_ then
			self.maxPoint_ = point
		end
	end

	table.sort(self.ids_)
end

function ActivityChildrenCollectAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityChildrenCollectAwardTable:getMaxPoint()
	return self.maxPoint_
end

function ActivityChildrenCollectAwardTable:getAward(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityChildrenCollectAwardTable:getIDs()
	return self.ids_
end

return ActivityChildrenCollectAwardTable
