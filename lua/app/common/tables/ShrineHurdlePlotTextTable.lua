-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdlePlotTextTable.lua

local ShrineHurdlePlotTextTable = class("ShrineHurdlePlotTextTable", import("app.common.tables.BaseTable"))

function ShrineHurdlePlotTextTable:ctor()
	ShrineHurdlePlotTextTable.super.ctor(self, "shrine_plot_list_text_" .. tostring(xyd.Global.lang))
end

function ShrineHurdlePlotTextTable:getTitle(id)
	return self:getString(id, "title")
end

return ShrineHurdlePlotTextTable
