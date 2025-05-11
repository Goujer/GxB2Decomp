-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetSkillTextTable.lua

local PetSkillTextTable = class("PetSkillTextTable", import("app.common.tables.BaseTable"))

function PetSkillTextTable:ctor()
	PetSkillTextTable.super.ctor(self, "pet_skill_text_" .. tostring(xyd.Global.lang))
end

function PetSkillTextTable:getName(id)
	return self:getString(id, "name")
end

function PetSkillTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return PetSkillTextTable
