-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerCommnetTable.lua

local PartnerCommentTable = class("PartnerCommentTable", import("app.common.tables.BaseTable"))

function PartnerCommentTable:ctor()
	PartnerCommentTable.super.ctor(self, "partner_comment")
end

function PartnerCommentTable:getPartnerTableIDs(name)
	return xyd.split(self:getString(name, "table_ids"), "|", true)
end

return PartnerCommentTable
