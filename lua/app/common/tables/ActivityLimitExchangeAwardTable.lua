-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitExchangeAwardTable.lua

local ActivityLimitExchangeAwardTable = class("ActivityLimitExchangeAwardTable", import("app.common.tables.BaseTable"))

function ActivityLimitExchangeAwardTable:ctor()
	ActivityLimitExchangeAwardTable.super.ctor(self, "activity_limit_exchange_awards")

	self.ids_ = {}
	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		if not self.ids_[v[2]] then
			self.ids_[v[2]] = {}
		end

		table.insert(self.ids, tonumber(id))
		table.insert(self.ids_[v[2]], tonumber(id))
	end

	table.sort(self.ids)

	for i = 1, #self.ids_ do
		table.sort(self.ids_[i])
	end
end

function ActivityLimitExchangeAwardTable:getLastID()
	return self.ids[#self.ids]
end

function ActivityLimitExchangeAwardTable:getIDs(index)
	if index == 0 then
		return self.ids
	else
		return self.ids_[index]
	end
end

function ActivityLimitExchangeAwardTable:getTab(id)
	return self:getNumber(id, "tab")
end

function ActivityLimitExchangeAwardTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityLimitExchangeAwardTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityLimitExchangeAwardTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

return ActivityLimitExchangeAwardTable
