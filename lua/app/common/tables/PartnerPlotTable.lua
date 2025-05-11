-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerPlotTable.lua

local PartnerPlotTable = class("PartnerPlotTable", import("app.common.tables.BasePlotTable"))

function PartnerPlotTable:ctor()
	PartnerPlotTable.super.ctor(self, "partner_plot")
end

function PartnerPlotTable:getName(id)
	return xyd.tables.partnerPlotTextTable:getName(id)
end

function PartnerPlotTable:getDialog(id)
	return xyd.tables.partnerPlotTextTable:getDialog(id)
end

function PartnerPlotTable:getSelects(id)
	return xyd.tables.partnerPlotTextTable:getSelects(id)
end

return PartnerPlotTable
