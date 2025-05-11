-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PlayerReturnStoryTextTable.lua

local PlayerReturnStoryTextTable = class("PlayerReturnStoryTextTable", import("app.common.tables.BasePlotTextTable"))

function PlayerReturnStoryTextTable:ctor()
	PlayerReturnStoryTextTable.super.ctor(self, "player_return_story")
end

return PlayerReturnStoryTextTable
