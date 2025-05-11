-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLassoAwardsTable.lua

local ActivityLassoAwardsTable = class("ActivityLassoAwardsTable", import("app.common.tables.BaseTable"))

function ActivityLassoAwardsTable:ctor()
	ActivityLassoAwardsTable.super.ctor(self, "activity_lasso_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLassoAwardsTable:getIDs()
	return self.ids_
end

function ActivityLassoAwardsTable:getAwards(id)
	local id_ = id

	if id > #self.ids_ then
		id_ = #self.ids_
	end

	return self:split2Cost(id_, "awards", "|#")
end

return ActivityLassoAwardsTable
