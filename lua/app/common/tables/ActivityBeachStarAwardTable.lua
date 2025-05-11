-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachStarAwardTable.lua

local ActivityBeachStarAwardTable = class("ActivityBeachStarAwardTable", import("app.common.tables.BaseTable"))

function ActivityBeachStarAwardTable:ctor()
	ActivityBeachStarAwardTable.super.ctor(self, "activity_beach_star_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityBeachStarAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityBeachStarAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityBeachStarAwardTable:getTotalPoint()
	return self:getPoint(self.ids_[#self.ids_])
end

function ActivityBeachStarAwardTable:getIDs()
	return self.ids_
end

return ActivityBeachStarAwardTable
