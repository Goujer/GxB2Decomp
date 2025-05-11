-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGoldfishTable.lua

local ActivityGoldfishTable = class("ActivityGoldfishTable", import(".BaseTable"))

function ActivityGoldfishTable:ctor()
	ActivityGoldfishTable.super.ctor(self, "activity_goldfish")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityGoldfishTable:getIDs()
	return self.ids_
end

function ActivityGoldfishTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityGoldfishTable:getShowRate(id)
	return self:getNumber(id, "weight_show")
end

function ActivityGoldfishTable:getRate(id)
	return self:getNumber(id, "rate")
end

function ActivityGoldfishTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityGoldfishTable:isSpecial(id)
	return self:getNumber(id, "is_special") == 1
end

function ActivityGoldfishTable:getIsSpread(id)
	return self:getNumber(id, "is_spread")
end

function ActivityGoldfishTable:getAwardsList()
	local ids = self:getIDs()
	local params = {}

	for _, id in ipairs(ids) do
		local item = self:getAwards(id)

		table.insert(params, item)
	end

	return params
end

function ActivityGoldfishTable:getWeights()
	local ids = self:getIDs()
	local params = {}

	for _, id in ipairs(ids) do
		local weight_show = self:getShowRate(id)

		table.insert(params, weight_show)
	end

	return params
end

return ActivityGoldfishTable
