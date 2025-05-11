-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeekBuyTable.lua

local ActivityWeekBuyTable = class("ActivityWeekBuyTable", import("app.common.tables.BaseTable"))

function ActivityWeekBuyTable:ctor()
	ActivityWeekBuyTable.super.ctor(self, "activity_week_buy")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local day = self:getDayLimit(id)

		if not self.ids_[day] then
			self.ids_[day] = {}
		end

		table.insert(self.ids_[day], tonumber(id))
	end

	for i = 1, #self.ids_ do
		table.sort(self.ids_[i])
	end
end

function ActivityWeekBuyTable:getIds()
	return self.ids_
end

function ActivityWeekBuyTable:getIndexByDay(day)
	if day == 1 then
		return 1
	end

	local len = 0

	for i = 1, day - 1 do
		len = len + #self.ids_[i]
	end

	return len + 1
end

function ActivityWeekBuyTable:getDayLimit(id)
	return self:getNumber(id, "day_limit")
end

return ActivityWeekBuyTable
