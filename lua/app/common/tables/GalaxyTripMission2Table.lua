-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripMission2Table.lua

local galaxyTripMission2Table = class("galaxyTripMission2Table", import("app.common.tables.BaseTable"))

function galaxyTripMission2Table:ctor()
	galaxyTripMission2Table.super.ctor(self, "galaxy_trip_mission2")

	self.ids_ = {}
	self.idsBySeason = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function galaxyTripMission2Table:getIDs()
	return self.ids_
end

function galaxyTripMission2Table:getIDsBySeason(season)
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

function galaxyTripMission2Table:getExplorePoints(id)
	return self:getNumber(id, "explore_points")
end

function galaxyTripMission2Table:getType(id)
	return self:getNumber(id, "type")
end

function galaxyTripMission2Table:getComplete(id)
	return self:getNumber(id, "complete")
end

function galaxyTripMission2Table:getTextId(id)
	return self:getNumber(id, "text_id")
end

function galaxyTripMission2Table:getBeginSeason(id)
	return self:getNumber(id, "begin_season")
end

function galaxyTripMission2Table:getDesc(id)
	return xyd.tables.galaxyTripMissionTextTable:getDesc(self:getTextId(id))
end

return galaxyTripMission2Table
