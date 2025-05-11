-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeekExchangeTable.lua

local ActivityWeekExchangeTable = class("ActivityWeekExchangeTable", import("app.common.tables.BaseTable"))

function ActivityWeekExchangeTable:ctor()
	ActivityWeekExchangeTable.super.ctor(self, "activity_week_exchange")

	self.dayList = {}

	for i = 1, 7 do
		table.insert(self.dayList, {})
	end

	for id, _ in pairs(self.TableLua.rows) do
		local day = self:getDayLimit(id)

		table.insert(self.dayList[day], id)
	end
end

function ActivityWeekExchangeTable:getMissionList(day)
	return self.dayList[day]
end

function ActivityWeekExchangeTable:getDayLimit(id)
	return self:getNumber(id, "day_limit")
end

function ActivityWeekExchangeTable:getTag(id)
	return self:getNumber(id, "label")
end

function ActivityWeekExchangeTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityWeekExchangeTable:getDesc(id)
	return xyd.tables.activityWeekExchangeTextTable:getDesc(self:getType(id))
end

function ActivityWeekExchangeTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityWeekExchangeTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityWeekExchangeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityWeekExchangeTable:getVipLimit(id)
	return self:getNumber(id, "vip_limit")
end

return ActivityWeekExchangeTable
