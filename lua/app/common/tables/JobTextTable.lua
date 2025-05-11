-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/JobTextTable.lua

local JobTextTable = class("JobTextTable", import("app.common.tables.BaseTable"))

function JobTextTable:ctor()
	JobTextTable.super.ctor(self, "job_text_" .. tostring(xyd.Global.lang))
end

function JobTextTable:getName(id)
	return self:getString(id, "name")
end

return JobTextTable
