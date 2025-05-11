-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCandyCollectTextTable.lua

local ActivityCandyCollectTextTable = class("ActivityCandyCollectTextTable", import("app.common.tables.BaseTable"))

function ActivityCandyCollectTextTable:ctor()
	ActivityCandyCollectTextTable.super.ctor(self, "activity_candy_collect_text_" .. string.lower(xyd.lang))
end

function ActivityCandyCollectTextTable:getTitle(id)
	return self:getString(id, "title")
end

return ActivityCandyCollectTextTable
