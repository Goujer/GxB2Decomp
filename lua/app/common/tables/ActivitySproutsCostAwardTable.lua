-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySproutsCostAwardTable.lua

local BaseTable = import(".BaseTable")
local ActivitySproutsCostAwardTable = class("ActivitySproutsCostAwardTable", BaseTable)

function ActivitySproutsCostAwardTable:ctor()
	BaseTable.ctor(self, "activity_sprouts_cost_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	self.totalWeight = 0

	for id in pairs(self.ids_) do
		if self:getNumber(id, "is_height") ~= 1 then
			self.totalWeight = self.totalWeight + self:getNumber(id, "weight")
		end
	end
end

function ActivitySproutsCostAwardTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivitySproutsCostAwardTable:getIDs()
	return self.ids_
end

function ActivitySproutsCostAwardTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function ActivitySproutsCostAwardTable:isHeight(id)
	return self:getNumber(id, "is_height")
end

function ActivitySproutsCostAwardTable:getProbability(id)
	return self:getNumber(id, "weight") / self.totalWeight
end

return ActivitySproutsCostAwardTable
