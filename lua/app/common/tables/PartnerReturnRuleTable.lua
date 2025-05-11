-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerReturnRuleTable.lua

local PartnerReturnRuleTable = class("PartnerReturnRuleTable", import(".BaseTable"))

function PartnerReturnRuleTable:ctor()
	PartnerReturnRuleTable.super.ctor(self, "partner_return_rule")
end

function PartnerReturnRuleTable:getReturnPartner(star, group)
	print("star")
	print(star)
	print("group")
	print(group)

	return self:split2Cost(star, "group_" .. group, "|#")
end

return PartnerReturnRuleTable
