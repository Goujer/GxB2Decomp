-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrinePlotTabTextTable.lua

local ShrinePlotTabTextTable = class("ShrinePlotTabTextTable", import("app.common.tables.BaseTable"))

function ShrinePlotTabTextTable:ctor()
	ShrinePlotTabTextTable.super.ctor(self, "shrine_plot_tab_text_" .. tostring(xyd.Global.lang))
end

function ShrinePlotTabTextTable:getTitle(id)
	return self:getString(id, "tab")
end

return ShrinePlotTabTextTable
