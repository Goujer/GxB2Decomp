-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEnconterStarAwardsTable.lua

local ActivityEnconterStarAwardsTable = class("ActivityEnconterStarAwardsTable", import("app.common.tables.BaseTable"))

function ActivityEnconterStarAwardsTable:ctor()
	ActivityEnconterStarAwardsTable.super.ctor(self, "activity_encounter_star_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEnconterStarAwardsTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityEnconterStarAwardsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityEnconterStarAwardsTable:getTotalPoint()
	return self:getPoint(self.ids_[#self.ids_])
end

function ActivityEnconterStarAwardsTable:getIDs()
	return self.ids_
end

return ActivityEnconterStarAwardsTable
