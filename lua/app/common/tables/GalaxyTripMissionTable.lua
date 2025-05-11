-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripMissionTable.lua

local GalaxyTripMissionTable = class("GalaxyTripMissionTable", import("app.common.tables.BaseTable"))

function GalaxyTripMissionTable:ctor()
	GalaxyTripMissionTable.super.ctor(self, "galaxy_trip_mission")

	self.ids_ = {}
	self.idsBySeason = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripMissionTable:getIDs()
	return self.ids_
end

function GalaxyTripMissionTable:getIDsBySeason(season)
	if not self.idsBySeason[season] then
		self.idsBySeason[season] = {}

		local ids = self:getIDs()

		for i = 1, #ids do
			local id = ids[i]
			local beginSeason = self:getBeginSeason(id)

			if beginSeason <= season then
				table.insert(self.idsBySeason[season], id)
			end
		end
	end

	return self.idsBySeason[season]
end

function GalaxyTripMissionTable:getExplorePoints(id)
	return self:getNumber(id, "explore_points")
end

function GalaxyTripMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function GalaxyTripMissionTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function GalaxyTripMissionTable:getTextId(id)
	return self:getNumber(id, "text_id")
end

function GalaxyTripMissionTable:getBeginSeason(id)
	return self:getNumber(id, "begin_season")
end

function GalaxyTripMissionTable:getDesc(id)
	return xyd.tables.galaxyTripMissionTextTable:getDesc(self:getTextId(id))
end

return GalaxyTripMissionTable
