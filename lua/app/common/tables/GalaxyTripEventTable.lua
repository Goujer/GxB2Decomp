-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripEventTable.lua

local GalaxyTripEventTable = class("GalaxyTripEventTable", import("app.common.tables.BaseTable"))

function GalaxyTripEventTable:ctor()
	GalaxyTripEventTable.super.ctor(self, "galaxy_trip_event")

	self.ids_ = {}
	self.idsByMapID_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local mapID = self:getMapId(tonumber(id))

		if not self.idsByMapID_[mapID] then
			self.idsByMapID_[mapID] = {}
		end

		table.insert(self.idsByMapID_[mapID], tonumber(id))
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripEventTable:getIDs()
	return self.ids_
end

function GalaxyTripEventTable:getIDsByMap(mapID)
	return self.idsByMapID_[mapID]
end

function GalaxyTripEventTable:getType(id)
	return self:getNumber(id, "type")
end

function GalaxyTripEventTable:getBattleId(id)
	return self:split2Cost(id, "battle_id", "|", true)
end

function GalaxyTripEventTable:getDifficultyId(id)
	return self:getNumber(id, "difficulty_id")
end

function GalaxyTripEventTable:getExplorePoints(id)
	return self:getNumber(id, "explore_points")
end

function GalaxyTripEventTable:getAward1(id)
	return self:split2Cost(id, "award1", "|#", true)
end

function GalaxyTripEventTable:getAward2(id)
	return self:split2Cost(id, "award2", "|#", true)
end

function GalaxyTripEventTable:getAward3(id)
	return self:split2Cost(id, "award3", "|#", true)
end

function GalaxyTripEventTable:getSkillId(id)
	return self:getNumber(id, "skill_id")
end

function GalaxyTripEventTable:getMapId(id)
	return self:getNumber(id, "map_id")
end

function GalaxyTripEventTable:getAreaId(id)
	return self:split2Cost(id, "area_id", "|", true)
end

function GalaxyTripEventTable:getAmount(id)
	return self:getNumber(id, "amount")
end

return GalaxyTripEventTable
