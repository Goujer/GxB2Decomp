-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPirateRandomAwardTable.lua

local ActivityPirateRandomAwardTable = class("ActivityPirateRandomAwardTable", import("app.common.tables.BaseTable"))

function ActivityPirateRandomAwardTable:ctor()
	ActivityPirateRandomAwardTable.super.ctor(self, "activity_pirate_random_awards")

	self.ids_ = {}
	self.totalWeight_ = 0

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local show_weight = self:getShowRate(id)

		self.totalWeight_ = self.totalWeight_ + show_weight
	end

	table.sort(self.ids_)
end

function ActivityPirateRandomAwardTable:getIDs()
	return self.ids_
end

function ActivityPirateRandomAwardTable:getShowRate(id)
	return self:getNumber(id, "show_weigh")
end

function ActivityPirateRandomAwardTable:getRate(id)
	return math.floor(self:getNumber(id, "show_weigh") / self.totalWeight_ * 100) / 100
end

function ActivityPirateRandomAwardTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityPirateRandomAwardTable
