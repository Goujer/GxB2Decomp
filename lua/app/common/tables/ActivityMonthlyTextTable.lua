-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthlyTextTable.lua

local ActivityMonthlyTextTable = class("ActivityMonthlyTextTable", import("app.common.tables.BaseTable"))

function ActivityMonthlyTextTable:ctor()
	ActivityMonthlyTextTable.super.ctor(self, "activity_monthly_total_text_" .. tostring(xyd.Global.lang))
end

function ActivityMonthlyTextTable:getText(id)
	return self:getString(id, "desc")
end

return ActivityMonthlyTextTable
