-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetExskillGuideTextTable.lua

local PetExskillGuideTextTable = class("PetExskillGuideTextTable", import("app.common.tables.BaseTable"))

function PetExskillGuideTextTable:ctor()
	PetExskillGuideTextTable.super.ctor(self, "pet_exskill_guide_text_" .. tostring(xyd.Global.lang))
end

function PetExskillGuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return PetExskillGuideTextTable
