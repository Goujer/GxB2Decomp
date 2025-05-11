-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeekExchangeTextTable.lua

local ActivityWeekExchangeTextTable = class("ActivityWeekExchangeTextTable", import("app.common.tables.BaseTable"))

function ActivityWeekExchangeTextTable:ctor()
	ActivityWeekExchangeTextTable.super.ctor(self, "activity_week_exchange_text_" .. xyd.Global.lang)
end

function ActivityWeekExchangeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityWeekExchangeTextTable
