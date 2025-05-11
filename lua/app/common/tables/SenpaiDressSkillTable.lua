-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressSkillTable.lua

local SenpaiDressSkillTable = class("SenpaiDressSkillTable", import("app.common.tables.BaseTable"))

function SenpaiDressSkillTable:ctor()
	SenpaiDressSkillTable.super.ctor(self, "senpai_dress_skill")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressSkillTable:getIDs()
	return self.ids_
end

function SenpaiDressSkillTable:getBuff(id)
	return self:getNumber(id, "buff")
end

function SenpaiDressSkillTable:getStyle(id)
	return self:getNumber(id, "style")
end

function SenpaiDressSkillTable:getNums(id)
	return self:split2num(id, "num", "|", true)
end

function SenpaiDressSkillTable:getIsPercent(id)
	return self:split2num(id, "is_percent", "|")
end

function SenpaiDressSkillTable:getFirstId(id)
	return self:getNumber(id, "first_id")
end

return SenpaiDressSkillTable
