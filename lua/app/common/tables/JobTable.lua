-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/JobTable.lua

local JobTable = class("JobTable", import("app.common.tables.BaseTable"))

function JobTable:ctor()
	JobTable.super.ctor(self, "job")
end

function JobTable:getName(id)
	return xyd.tables.jobTextTable:getName(id)
end

return JobTable
