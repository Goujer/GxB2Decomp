-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerReplaceTable.lua

local PartnerReplaceTable = class("PartnerReplaceTable", import("app.common.tables.BaseTable"))

function PartnerReplaceTable:ctor()
	PartnerReplaceTable.super.ctor(self, "partner_replace")
end

function PartnerReplaceTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function PartnerReplaceTable:getDropBoxId(id)
	return self:getNumber(id, "dropbox_id")
end

return PartnerReplaceTable
