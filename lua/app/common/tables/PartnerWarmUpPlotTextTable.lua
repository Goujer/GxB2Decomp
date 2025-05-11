-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerWarmUpPlotTextTable.lua

local PartnerWarmUpPlotTextTable = class("PartnerWarmUpPlotTextTable", import("app.common.tables.BasePlotTextTable"))

function PartnerWarmUpPlotTextTable:ctor()
	PartnerWarmUpPlotTextTable.super.ctor(self, "partner_warmup_plot")
end

return PartnerWarmUpPlotTextTable
