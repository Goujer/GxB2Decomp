-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTimeMissionTextTable.lua

local ActivityTimeMissionTextTable = class("ActivityTimeMissionTextTable", import("app.common.tables.BaseTable"))

function ActivityTimeMissionTextTable:ctor()
	ActivityTimeMissionTextTable.super.ctor(self, "activity_time_mission_text_" .. xyd.Global.lang)
end

function ActivityTimeMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityTimeMissionTextTable
