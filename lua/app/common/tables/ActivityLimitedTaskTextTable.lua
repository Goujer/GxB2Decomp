-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitedTaskTextTable.lua

local ActivityLimitedTaskTextTable = class("ActivityLimitedTaskTextTable", import(".BaseTable"))

function ActivityLimitedTaskTextTable:ctor()
	ActivityLimitedTaskTextTable.super.ctor(self, "activity_limited_task_text_" .. xyd.Global.lang)
end

function ActivityLimitedTaskTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityLimitedTaskTextTable
