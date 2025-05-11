-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerPlotTextTable.lua

local PartnerPlotTextTable = class("PartnerPlotTextTable", import("app.common.tables.BasePlotTextTable"))

function PartnerPlotTextTable:ctor()
	PartnerPlotTextTable.super.ctor(self, "partner_plot")
end

return PartnerPlotTextTable
