-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripStore1Table.lua

local GalaxyTripStore1Table = class("GalaxyTripStore1Table", import("app.common.tables.BaseTable"))

function GalaxyTripStore1Table:ctor()
	GalaxyTripStore1Table.super.ctor(self, "galaxy_trip_store1")

	self.ids_ = {}
	self.pointRanks = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripStore1Table:getIDs()
	return self.ids_
end

function GalaxyTripStore1Table:getItem(id)
	return self:split2Cost(id, "item", "#", true)
end

function GalaxyTripStore1Table:getPointLimit(id)
	return self:getNumber(id, "point_limit")
end

function GalaxyTripStore1Table:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function GalaxyTripStore1Table:getTextId(id)
	return self:getNumber(id, "text_id")
end

function GalaxyTripStore1Table:getBuyLimit(id)
	return self:getNumber(id, "buy_limit")
end

function GalaxyTripStore1Table:getBeginSeason(id)
	return self:getNumber(id, "begin_season") or 0
end

function GalaxyTripStore1Table:getLayerRankArr(season)
	local ids = {}

	for i = 1, #self.ids_ do
		local id = self.ids_[i]
		local beginSeason = self:getBeginSeason(id)

		if beginSeason <= season then
			table.insert(ids, id)
		end
	end

	self.pointRanks = {}

	local helpArr = {}

	for i = 1, #ids do
		local id = ids[i]
		local point = self:getPointLimit(tonumber(id))

		if not helpArr[point] then
			helpArr[point] = 1

			table.insert(self.pointRanks, point)
		end
	end

	return self.pointRanks
end

function GalaxyTripStore1Table:getItemLayerKeyData(season)
	local ids = {}

	for i = 1, #self.ids_ do
		local id = self.ids_[i]
		local beginSeason = self:getBeginSeason(id)

		if beginSeason <= season then
			table.insert(ids, id)
		end
	end

	local datas = {}

	for i = 1, #ids do
		local id = tonumber(ids[i])

		table.insert(datas, self:getPointLimit(id))
	end

	return datas
end

return GalaxyTripStore1Table
