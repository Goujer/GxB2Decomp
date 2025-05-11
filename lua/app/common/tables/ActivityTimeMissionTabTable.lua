-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTimeMissionTabTable.lua

local ActivityTimeMissionTabTable = class("ActivityTimeMissionTabTable", import("app.common.tables.BaseTable"))

function ActivityTimeMissionTabTable:ctor()
	ActivityTimeMissionTabTable.super.ctor(self, "activity_time_mission_tab")
end

function ActivityTimeMissionTabTable:getIds(time)
	return self:split2num(time, "id", "|")
end

return ActivityTimeMissionTabTable
