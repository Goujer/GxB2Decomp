-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrinePlotListTextTable.lua

local ShrinePlotListTextTable = class("ShrinePlotListTextTable", import("app.common.tables.BaseTable"))

function ShrinePlotListTextTable:ctor()
	ShrinePlotListTextTable.super.ctor(self, "shrine_plot_list_text_" .. tostring(xyd.Global.lang))
end

function ShrinePlotListTextTable:getTitle(id)
	return self:getString(id, "title")
end

return ShrinePlotListTextTable
