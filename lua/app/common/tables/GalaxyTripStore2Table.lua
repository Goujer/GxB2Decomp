-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripStore2Table.lua

local GalaxyTripStore2Table = class("GalaxyTripStore2Table", import("app.common.tables.BaseTable"))

function GalaxyTripStore2Table:ctor()
	GalaxyTripStore2Table.super.ctor(self, "galaxy_trip_store2")

	self.ids_ = {}
	self.pointRanks = {}

	local helpArr = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripStore2Table:getIDs()
	return self.ids_
end

function GalaxyTripStore2Table:getItem(id)
	return self:split2Cost(id, "item", "#", true)
end

function GalaxyTripStore2Table:getTripLimit(id)
	return self:split2Cost(id, "trip_limit", "|", true)
end

function GalaxyTripStore2Table:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function GalaxyTripStore2Table:getTextId(id)
	return self:getNumber(id, "text_id")
end

function GalaxyTripStore2Table:getBuyLimit(id)
	return self:getNumber(id, "buy_limit")
end

function GalaxyTripStore2Table:getBeginSeason(id)
	return self:getNumber(id, "begin_season") or 0
end

function GalaxyTripStore2Table:getLayerRankArr(season)
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
		local limits = self:getTripLimit(tonumber(id))
		local key = limits[1] .. "_" .. limits[2]

		if not helpArr[key] then
			helpArr[key] = 1

			table.insert(self.pointRanks, key)
		end
	end

	return self.pointRanks
end

function GalaxyTripStore2Table:getItemLayerKeyData(season)
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
		local limits = self:getTripLimit(tonumber(id))
		local key = limits[1] .. "_" .. limits[2]

		table.insert(datas, key)
	end

	dump(datas)

	return datas
end

return GalaxyTripStore2Table
