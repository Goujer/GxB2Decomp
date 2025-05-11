-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleEventTextTable.lua

local ActivityFairyTaleEventTextTable = class("ActivityFairyTaleEventTextTable", import(".BaseTable"))

function ActivityFairyTaleEventTextTable:ctor()
	ActivityFairyTaleEventTextTable.super.ctor(self, "activity_fairytale_event_text_" .. tostring(xyd.Global.lang))
end

function ActivityFairyTaleEventTextTable:getName(id)
	return self:getString(id, "event_name")
end

function ActivityFairyTaleEventTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityFairyTaleEventTextTable
