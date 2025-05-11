-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerWarmUpPlotTable.lua

local PartnerWarmUpPlotTable = class("PartnerWarmUpPlotTable", import("app.common.tables.BasePlotTable"))

function PartnerWarmUpPlotTable:ctor()
	PartnerWarmUpPlotTable.super.ctor(self, "partner_warmup_plot")
end

function PartnerWarmUpPlotTable:getName(id)
	return xyd.tables.partnerWarmUpPlotTextTable:getName(id)
end

function PartnerWarmUpPlotTable:getDialog(id)
	return xyd.tables.partnerWarmUpPlotTextTable:getDialog(id)
end

function PartnerWarmUpPlotTable:getSelects(id)
	return xyd.tables.partnerWarmUpPlotTextTable:getSelects(id)
end

return PartnerWarmUpPlotTable
