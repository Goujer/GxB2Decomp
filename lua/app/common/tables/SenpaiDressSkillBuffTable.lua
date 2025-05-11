-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressSkillBuffTable.lua

local SenpaiDressSkillBuffTable = class("SenpaiDressSkillBuffTable", import("app.common.tables.BaseTable"))

function SenpaiDressSkillBuffTable:ctor()
	SenpaiDressSkillBuffTable.super.ctor(self, "senpai_dress_skill_buff")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressSkillBuffTable:getIDs()
	return self.ids_
end

function SenpaiDressSkillBuffTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function SenpaiDressSkillBuffTable:getShowTime(id)
	return self:getNumber(id, "show_time")
end

function SenpaiDressSkillBuffTable:getIcon(id)
	return self:getString(id, "icon")
end

function SenpaiDressSkillBuffTable:getScale(id)
	return self:getNumber(id, "scale")
end

function SenpaiDressSkillBuffTable:getQlt(id)
	return self:getNumber(id, "qlt")
end

function SenpaiDressSkillBuffTable:getRelatedDress(id)
	return self:split2Cost(id, "related_dress", "|", true)
end

function SenpaiDressSkillBuffTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function SenpaiDressSkillBuffTable:getSkillId(id)
	return self:getNumber(id, "skill_id")
end

return SenpaiDressSkillBuffTable
