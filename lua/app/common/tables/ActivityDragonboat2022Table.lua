-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDragonboat2022Table.lua

local ActivityDragonboat2022Table = class("ActivityDragonboat2022Table", import("app.common.tables.BaseTable"))

function ActivityDragonboat2022Table:ctor()
	ActivityDragonboat2022Table.super.ctor(self, "activity_dragonboat2022")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityDragonboat2022Table:getIDs()
	return self.ids
end

function ActivityDragonboat2022Table:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityDragonboat2022Table:getPoint(id)
	return self:getNumber(id, "num")
end

return ActivityDragonboat2022Table
