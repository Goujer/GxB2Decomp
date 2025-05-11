-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTuringTextTable.lua

local ActivityTuringTextTable = class("ActivityTuringTextTable", import("app.common.tables.BaseTable"))

function ActivityTuringTextTable:ctor()
	ActivityTuringTextTable.super.ctor(self, "activity_turing_task_text_" .. tostring(xyd.Global.lang))
end

function ActivityTuringTextTable:getDesc(id)
	return self:getString(id, "task_desc")
end

function ActivityTuringTextTable:getText(id)
	return self:getString(id, "text")
end

return ActivityTuringTextTable
