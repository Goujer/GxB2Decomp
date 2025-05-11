-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEaster2022AwardsTable.lua

local ActivityEaster2022AwardsTable = class("ActivityEaster2022AwardsTable", import("app.common.tables.BaseTable"))

function ActivityEaster2022AwardsTable:ctor()
	ActivityEaster2022AwardsTable.super.ctor(self, "activity_easter2022_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEaster2022AwardsTable:getIDs()
	return self.ids_
end

function ActivityEaster2022AwardsTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityEaster2022AwardsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ActivityEaster2022AwardsTable
