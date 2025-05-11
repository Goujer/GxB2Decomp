-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerLabelTable.lua

local BaseTable = import(".BaseTable")
local PartnerLabelTable = class("PartnerLabelTable", BaseTable)

function PartnerLabelTable:ctor()
	PartnerLabelTable.super.ctor(self, "direct_label")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function PartnerLabelTable:getIds()
	return self.ids_
end

function PartnerLabelTable:getLabelType(id)
	return self:getNumber(id, "label_type")
end

function PartnerLabelTable:getLabelText(id)
	return xyd.tables.partnerLabelTextTable:getLabelText(id)
end

return PartnerLabelTable
