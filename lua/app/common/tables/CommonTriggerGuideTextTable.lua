-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CommonTriggerGuideTextTable.lua

local CommonTriggerGuideTextTable = class("CommonTriggerGuideTextTable", import("app.common.tables.BaseTable"))

function CommonTriggerGuideTextTable:ctor()
	CommonTriggerGuideTextTable.super.ctor(self, "common_trigger_guide_text_" .. tostring(xyd.Global.lang))
end

function CommonTriggerGuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return CommonTriggerGuideTextTable
