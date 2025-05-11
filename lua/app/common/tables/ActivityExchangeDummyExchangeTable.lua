-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityExchangeDummyExchangeTable.lua

local ActivityExchangeDummyExchangeTable = class("ActivityExchangeDummyExchangeTable", import("app.common.tables.BaseTable"))

function ActivityExchangeDummyExchangeTable:ctor()
	ActivityExchangeDummyExchangeTable.super.ctor(self, "activity_doll_exchange")

	self.ids = {}
	self.showIds = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		local show = self:getShow(id)

		if not self.showIds[show] then
			self.showIds[show] = {}
		end

		table.insert(self.showIds[show], tonumber(id))
	end

	table.sort(self.ids)

	for _, ids in ipairs(self.showIds) do
		table.sort(ids)
	end
end

function ActivityExchangeDummyExchangeTable:getIDs()
	return self.ids
end

function ActivityExchangeDummyExchangeTable:getShowIds()
	return self.showIds
end

function ActivityExchangeDummyExchangeTable:getShow(id)
	return self:getNumber(id, "show")
end

function ActivityExchangeDummyExchangeTable:getCost(id)
	return self:split2num(id, "item_cost", "#")
end

function ActivityExchangeDummyExchangeTable:getAward(id)
	return self:split2num(id, "awards", "#")
end

function ActivityExchangeDummyExchangeTable:getCostByShow(showId)
	local id = self.showIds[showId][1]

	return self:getCost(id)
end

return ActivityExchangeDummyExchangeTable
