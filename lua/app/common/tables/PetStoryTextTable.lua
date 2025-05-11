-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetStoryTextTable.lua

local PetStoryTextTable = class("PetStoryTextTable", import("app.common.tables.BaseTable"))

function PetStoryTextTable:ctor()
	PetStoryTextTable.super.ctor(self, "pet_story_text_" .. xyd.Global.lang)
end

function PetStoryTextTable:getTitle(id)
	return self:getString(id, "title")
end

function PetStoryTextTable:getText(id)
	return self:getString(id, "text")
end

return PetStoryTextTable
