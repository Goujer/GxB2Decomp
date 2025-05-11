-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerExSkillCostTable.lua

local PartnerExSkillCostTable = class("PartnerExSkillCostTable", import("app.common.tables.BaseTable"))

function PartnerExSkillCostTable:ctor()
	PartnerExSkillCostTable.super.ctor(self, "partner_exskill_cost")
end

function PartnerExSkillCostTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

return PartnerExSkillCostTable
