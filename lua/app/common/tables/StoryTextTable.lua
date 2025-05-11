-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StoryTextTable.lua

local StoryTextTable = class("StoryTextTable", import("app.common.tables.BasePlotTextTable"))

function StoryTextTable:ctor()
	StoryTextTable.super.ctor(self, "activity_plot")
end

return StoryTextTable
