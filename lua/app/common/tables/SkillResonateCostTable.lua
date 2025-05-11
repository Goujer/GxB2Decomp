-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SkillResonateCostTable.lua

local SkillResonateCostTable = class("SkillResonateCostTable", import("app.common.tables.BaseTable"))

function SkillResonateCostTable:ctor()
	SkillResonateCostTable.super.ctor(self, "skill_resonate_cost")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SkillResonateCostTable:getIDs()
	return self.ids_
end

function SkillResonateCostTable:getCost(id)
	return self:split2Cost(id, "cost", "|#", true)
end

return SkillResonateCostTable
