-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleBuffTextTable.lua

local ActivityFairyTaleBuffTextTable = class("ActivityFairyTaleBuffTextTable", import(".BaseTable"))

function ActivityFairyTaleBuffTextTable:ctor()
	ActivityFairyTaleBuffTextTable.super.ctor(self, "activity_fairytale_buff_text_" .. xyd.Global.lang)
end

function ActivityFairyTaleBuffTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityFairyTaleBuffTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityFairyTaleBuffTextTable
