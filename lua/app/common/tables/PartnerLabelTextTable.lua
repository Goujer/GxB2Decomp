-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerLabelTextTable.lua

local BaseTable = import(".BaseTable")
local PartnerLabelTextTable = class("PartnerLabelTextTable", BaseTable)

function PartnerLabelTextTable:ctor()
	BaseTable.ctor(self, "direct_label_text_" .. tostring(xyd.Global.lang))
end

function PartnerLabelTextTable:getLabelName(id)
	return self:getString(id, "label_name")
end

function PartnerLabelTextTable:getLabelText(id)
	return self:getString(id, "desc")
end

return PartnerLabelTextTable
