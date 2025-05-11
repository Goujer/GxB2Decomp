-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPetTaskTextTable.lua

local ActivityPetTaskTextTable = class("ActivityPetTaskTextTable", import("app.common.tables.BaseTable"))

function ActivityPetTaskTextTable:ctor()
	ActivityPetTaskTextTable.super.ctor(self, "activity_pet_task_text_" .. xyd.Global.lang)
end

function ActivityPetTaskTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityPetTaskTextTable
