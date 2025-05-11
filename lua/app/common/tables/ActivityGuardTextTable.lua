-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGuardTextTable.lua

local ActivityGuardTextTable = class("ActivityGuardTextTable", import("app.common.tables.BaseTable"))

function ActivityGuardTextTable:ctor()
	ActivityGuardTextTable.super.ctor(self, "activity_guard_text_" .. string.lower(xyd.lang))
end

function ActivityGuardTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityGuardTextTable:getDialog(id)
	return self:getString(id, "dialog")
end

return ActivityGuardTextTable
