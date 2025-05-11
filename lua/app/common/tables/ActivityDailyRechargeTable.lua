-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDailyRechargeTable.lua

local ActivityLimitCultivateTable = class("ActivityLimitCultivateTable", import("app.common.tables.BaseTable"))

function ActivityLimitCultivateTable:ctor()
	ActivityLimitCultivateTable.super.ctor(self, xyd.tables.miscTable:split("acticity_pay_day_awards_chang_excel", "value", "|")[1])

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLimitCultivateTable:getIDs()
	return self.ids_
end

function ActivityLimitCultivateTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

return ActivityLimitCultivateTable
