-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmCardAwardTable.lua

local ActivityWarmCardAwardTable = class("ActivityWarmCardAwardTable", import("app.common.tables.BaseTable"))

function ActivityWarmCardAwardTable:ctor()
	ActivityWarmCardAwardTable.super.ctor(self, "activity_warm_card_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityWarmCardAwardTable:getIds()
	return self.ids_
end

function ActivityWarmCardAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityWarmCardAwardTable:getAmount(id)
	return self:getNumber(id, "amount")
end

return ActivityWarmCardAwardTable
