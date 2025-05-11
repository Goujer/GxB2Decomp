-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySearchBookTextTable.lua

local ActivitySearchBookTextTable = class("ActivitySearchBookTextTable", import("app.common.tables.BaseTable"))

function ActivitySearchBookTextTable:ctor()
	ActivitySearchBookTextTable.super.ctor(self, "activity_search_book_text_" .. xyd.Global.lang)
end

function ActivitySearchBookTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivitySearchBookTextTable
