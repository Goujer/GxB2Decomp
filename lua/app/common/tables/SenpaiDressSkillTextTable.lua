-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressSkillTextTable.lua

local SenpaiDressSkillTextTable = class("SenpaiDressSkillTextTable", import("app.common.tables.BaseTable"))

function SenpaiDressSkillTextTable:ctor()
	SenpaiDressSkillTextTable.super.ctor(self, "senpai_dress_skill_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressSkillTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return SenpaiDressSkillTextTable
