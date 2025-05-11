-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitCultivateTable.lua

local ActivityLimitCultivateTable = class("ActivityLimitCultivateTable", import("app.common.tables.BaseTable"))

function ActivityLimitCultivateTable:ctor()
	ActivityLimitCultivateTable.super.ctor(self, "activity_5week_gamble")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLimitCultivateTable:getIDs()
	return self.ids_
end

function ActivityLimitCultivateTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityLimitCultivateTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

return ActivityLimitCultivateTable
