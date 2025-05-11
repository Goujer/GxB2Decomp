-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDailyRechargeGiftTable.lua

local ActivityDailyRechargeGiftTable = class("ActivityDailyRechargeGiftTable", import("app.common.tables.BaseTable"))

function ActivityDailyRechargeGiftTable:ctor()
	ActivityDailyRechargeGiftTable.super.ctor(self, xyd.tables.miscTable:split("acticity_pay_day_awards_chang_excel", "value", "|")[2])

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityDailyRechargeGiftTable:getIDs()
	return self.ids_
end

function ActivityDailyRechargeGiftTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

return ActivityDailyRechargeGiftTable
