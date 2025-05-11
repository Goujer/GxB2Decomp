-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerLabelTypeTable.lua

local BaseTable = import(".BaseTable")
local PartnerLabelTypeTable = class("PartnerLabelTypeTable", BaseTable)

function PartnerLabelTypeTable:ctor()
	BaseTable.ctor(self, "direct_label_type")
end

function PartnerLabelTypeTable:getLabelTextColor(id)
	return tonumber("0x" .. tostring(self:getString(id, "label_text_color") .. "ff"))
end

function PartnerLabelTypeTable:getLabelIcon(id)
	return self:getString(id, "label_icon")
end

return PartnerLabelTypeTable
