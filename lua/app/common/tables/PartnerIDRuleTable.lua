-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerIDRuleTable.lua

local PartnerIDRuleTable = class("PartnerIDRuleTable", import("app.common.tables.BaseTable"))

function PartnerIDRuleTable:ctor()
	PartnerIDRuleTable.super.ctor(self, "partner_id_rule")
end

function PartnerIDRuleTable:getStar(name)
	return self:getNumber(name, "star")
end

function PartnerIDRuleTable:getGroup(name)
	return self:getNumber(name, "group")
end

function PartnerIDRuleTable:getIcon(name)
	return self:getString(name, "icon")
end

function PartnerIDRuleTable:getFrame(name)
	return xyd.split(self:getString(name, "icon_frame"), "|")
end

function PartnerIDRuleTable:getJob(name)
	return self:getNumber(name, "job")
end

return PartnerIDRuleTable
