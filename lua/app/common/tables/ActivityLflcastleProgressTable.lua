-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLflcastleProgressTable.lua

local ActivityLflcastleProgressTable = class("ActivityLflcastleProgressTable", import("app.common.tables.BaseTable"))

function ActivityLflcastleProgressTable:ctor()
	ActivityLflcastleProgressTable.super.ctor(self, "activity_lflcastle_progress")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityLflcastleProgressTable:getIDs()
	return self.ids
end

function ActivityLflcastleProgressTable:getObject(id)
	return self:getString(id, "object")
end

function ActivityLflcastleProgressTable:getCount(id)
	return self:getNumber(id, "count")
end

function ActivityLflcastleProgressTable:getType(id)
	return self:getNumber(id, "type")
end

return ActivityLflcastleProgressTable
