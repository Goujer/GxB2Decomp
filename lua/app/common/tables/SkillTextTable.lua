-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SkillTextTable.lua

local SkillTextTable = class("SkillTextTable", import("app.common.tables.BaseTable"))

function SkillTextTable:ctor()
	SkillTextTable.super.ctor(self, "skill_text_" .. tostring(xyd.Global.lang))
end

function SkillTextTable:getName(id)
	return self:getString(id, "name")
end

function SkillTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return SkillTextTable
