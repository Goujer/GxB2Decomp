-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMusicGameTextTable.lua

local ActivityMusicGameTextTable = class("ActivityMusicGameTextTable", import("app.common.tables.BaseTable"))

function ActivityMusicGameTextTable:ctor()
	ActivityMusicGameTextTable.super.ctor(self, "activity_music_game_text_" .. string.lower(xyd.lang))
end

function ActivityMusicGameTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityMusicGameTextTable:getAuthor(id)
	return self:getString(id, "author")
end

return ActivityMusicGameTextTable
