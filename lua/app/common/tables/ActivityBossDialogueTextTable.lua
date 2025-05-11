-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBossDialogueTextTable.lua

local ActivityBossDialogueTextTable = class("ActivityBossAwardTable", import("app.common.tables.BaseTable"))

function ActivityBossDialogueTextTable:ctor()
	ActivityBossDialogueTextTable.super.ctor(self, "activity_boss_dialogue_text_" .. string.lower(xyd.lang))
end

function ActivityBossDialogueTextTable:getDialogue(activity_id, content_id)
	return self:getString("ACTIVITY_" .. tostring(activity_id) .. "_" .. tostring(content_id), "translation")
end

return ActivityBossDialogueTextTable
