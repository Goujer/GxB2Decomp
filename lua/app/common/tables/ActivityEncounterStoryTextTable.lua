-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEncounterStoryTextTable.lua

local ActivityEncounterStoryTextTable = class("ActivityEncounterStoryTextTable", import("app.common.tables.BaseTable"))

function ActivityEncounterStoryTextTable:ctor()
	ActivityEncounterStoryTextTable.super.ctor(self, "activity_encounter_story_text_" .. tostring(xyd.Global.lang))
end

function ActivityEncounterStoryTextTable:getTitle(id)
	return self:getString(id, "title")
end

function ActivityEncounterStoryTextTable:getText(id)
	return self:getString(id, "text")
end

return ActivityEncounterStoryTextTable
