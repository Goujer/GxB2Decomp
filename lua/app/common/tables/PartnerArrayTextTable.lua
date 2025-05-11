-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerArrayTextTable.lua

local BaseTable = import(".BaseTable")
local PartnerArrayTextTable = class("PartnerArrayTextTable", BaseTable)

function PartnerArrayTextTable:ctor()
	PartnerArrayTextTable.super.ctor(self, "direct_array_" .. tostring(xyd.Global.lang))
end

function PartnerArrayTextTable:getReasonText(id)
	return self:getString(id, "reason_text")
end

function PartnerArrayTextTable:getName(id)
	return self:getString(id, "name")
end

return PartnerArrayTextTable
