-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthlyChapterTable.lua

local ActivityMonthlyChapterTable = class("ActivityMonthlyChapterTable", import("app.common.tables.BaseTable"))

function ActivityMonthlyChapterTable:ctor()
	ActivityMonthlyChapterTable.super.ctor(self, "activity_monthly_chapter")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityMonthlyChapterTable:getIDs()
	return self.ids_
end

function ActivityMonthlyChapterTable:getStageIDs(id)
	return self:split2num(id, "stage_id", "|")
end

function ActivityMonthlyChapterTable:getMapID(id)
	return self:getNumber(id, "map")
end

function ActivityMonthlyChapterTable:getLineID(id)
	return self:getNumber(id, "line")
end

return ActivityMonthlyChapterTable
