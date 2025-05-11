-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCVTable.lua

local ActivityCVTable = class("ActivityCVTable", import("app.common.tables.BaseTable"))

function ActivityCVTable:ctor()
	ActivityCVTable.super.ctor(self, "activity_cv")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityCVTable:getSoundList(id)
	return self:split2Cost(id, "click_sound", "|")
end

function ActivityCVTable:getTimeList(id)
	return self:split2Cost(id, "time_sound", "|")
end

return ActivityCVTable
