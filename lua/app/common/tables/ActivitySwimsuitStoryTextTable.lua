-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySwimsuitStoryTextTable.lua

local ActivitySwimsuitStoryTextTable = class("ActivitySwimsuitStoryTextTable", import("app.common.tables.BaseTable"))

function ActivitySwimsuitStoryTextTable:ctor()
	ActivitySwimsuitStoryTextTable.super.ctor(self, "activity_swimsuit_story_text_" .. string.lower(xyd.lang))
end

function ActivitySwimsuitStoryTextTable:getChapter(id)
	return self:getString(id, "text")
end

return ActivitySwimsuitStoryTextTable
