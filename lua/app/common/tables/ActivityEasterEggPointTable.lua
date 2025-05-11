-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEasterEggPointTable.lua

local ActivityEasterEggPointTable = class("ActivityEasterEggPointTable", import("app.common.tables.BaseTable"))

function ActivityEasterEggPointTable:ctor()
	ActivityEasterEggPointTable.super.ctor(self, "activity_easter_egg_point")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityEasterEggPointTable:getIDs()
	return self.ids_
end

function ActivityEasterEggPointTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityEasterEggPointTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

return ActivityEasterEggPointTable
