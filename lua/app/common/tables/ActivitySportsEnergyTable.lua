-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsEnergyTable.lua

local BaseTable = import(".BaseTable")
local ActivitySportsEnergyTable = class("ActivitySportsEnergyTable", BaseTable)

function ActivitySportsEnergyTable:ctor()
	ActivitySportsEnergyTable.super.ctor(self, "activity_sports_energy")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, id)
	end

	table.sort(self.ids)
end

function ActivitySportsEnergyTable:getScore(id)
	return self:getNumber(id, "score")
end

function ActivitySportsEnergyTable:getMax(id)
	return self:getNumber(id, "max")
end

function ActivitySportsEnergyTable:getMaxByScore(score)
	for i in pairs(self.ids) do
		if score <= self:getScore(self.ids[i]) then
			return self:getMax(self.ids[i])
		end
	end

	return self:getMax(#self.ids)
end

function ActivitySportsEnergyTable:getCdByPoint(score)
	for i in pairs(self.ids) do
		if score <= self:getScore(self.ids[i]) then
			return self:getCd(self.ids[i])
		end
	end

	return self:getCd(#self.ids)
end

function ActivitySportsEnergyTable:getCd(id)
	return self:getNumber(id, "cd")
end

return ActivitySportsEnergyTable
