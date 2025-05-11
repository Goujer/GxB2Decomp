-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeekMissionTextTable.lua

local ActivityWeekMissionTextTable = class("ActivityWeekMissionTextTable", import("app.common.tables.BaseTable"))

function ActivityWeekMissionTextTable:ctor()
	ActivityWeekMissionTextTable.super.ctor(self, "activity_week_mission_text_" .. xyd.Global.lang)
end

function ActivityWeekMissionTextTable:getDesc(id, ...)
	local formatStr = self:getString(id, "desc")
	local __args = {
		...
	}
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	return result
end

return ActivityWeekMissionTextTable
