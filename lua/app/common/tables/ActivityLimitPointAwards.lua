-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitPointAwards.lua

local ActivityLimitPointAwards = class("ActivityLimitPointAwards", import("app.common.tables.BaseTable"))

function ActivityLimitPointAwards:ctor()
	ActivityLimitPointAwards.super.ctor(self, "activity_limit_point_awards")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLimitPointAwards:getIds()
	return self.ids_
end

function ActivityLimitPointAwards:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityLimitPointAwards:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

return ActivityLimitPointAwards
