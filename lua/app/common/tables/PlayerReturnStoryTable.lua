-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PlayerReturnStoryTable.lua

local PlayerReturnStoryTable = class("PlayerReturnStoryTable", import("app.common.tables.BasePlotTable"))

function PlayerReturnStoryTable:ctor()
	PlayerReturnStoryTable.super.ctor(self, "player_return_story")
end

function PlayerReturnStoryTable:getName(id)
	return xyd.tables.playerReturnStoryTextTable:getName(id)
end

function PlayerReturnStoryTable:getDialog(id)
	return xyd.tables.playerReturnStoryTextTable:getDialog(id)
end

function PlayerReturnStoryTable:getSelects(id)
	return xyd.tables.playerReturnStoryTextTable:getSelects(id)
end

return PlayerReturnStoryTable
