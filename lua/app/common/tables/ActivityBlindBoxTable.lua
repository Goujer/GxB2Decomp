-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBlindBoxTable.lua

local ActivityBlindBoxTable = class("ActivityBlindBoxTable", import(".BaseTable"))

function ActivityBlindBoxTable:ctor()
	ActivityBlindBoxTable.super.ctor(self, "activity_blind_box_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityBlindBoxTable:getIDs()
	return self.ids_
end

function ActivityBlindBoxTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityBlindBoxTable:getCycle(id)
	return self:getNumber(id, "cycle")
end

function ActivityBlindBoxTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityBlindBoxTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function ActivityBlindBoxTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityBlindBoxTable:getFirstPrizeID(cycle)
	local ids = self:getIDs()
	local firstPrize = 1

	for _, id in ipairs(ids) do
		if self:getType(id) == 1 and self:getCycle(id) == cycle then
			firstPrize = id
		end
	end

	return firstPrize
end

function ActivityBlindBoxTable:getFirstPrize(cycle)
	local id = self:getFirstPrizeID(cycle)

	return self:getAwards(id)
end

function ActivityBlindBoxTable:getAwardsList(cycle, type)
	local ids = self:getIDs()
	local params = {}

	for _, id in ipairs(ids) do
		if self:getCycle(id) == cycle and self:getType(id) == type then
			local item = self:getAwards(id)

			table.insert(params, item)
		end
	end

	return params
end

function ActivityBlindBoxTable:getAwardsIDList(cycle, type)
	local ids = self:getIDs()
	local params = {}

	for _, id in ipairs(ids) do
		if self:getCycle(id) == cycle and self:getType(id) == type then
			table.insert(params, id)
		end
	end

	return params
end

function ActivityBlindBoxTable:getWeights()
	local ids = self:getIDs()
	local params = {}

	for _, id in ipairs(ids) do
		local weight_show = self:getShowRate(id)

		table.insert(params, weight_show)
	end

	return params
end

return ActivityBlindBoxTable
