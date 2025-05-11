-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripMapTable.lua

local GalaxyTripMapTable = class("GalaxyTripMapTable", import("app.common.tables.BaseTable"))

function GalaxyTripMapTable:ctor()
	GalaxyTripMapTable.super.ctor(self, "galaxy_trip_map")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripMapTable:getIDs()
	return self.ids_
end

function GalaxyTripMapTable:getType(id)
	return self:getNumber(id, "type")
end

function GalaxyTripMapTable:getSize(id)
	return self:split2Cost(id, "size", "|", true)
end

function GalaxyTripMapTable:getIconText(id)
	return self:getString(id, "icon_text")
end

function GalaxyTripMapTable:getIconBigText(id)
	return self:getString(id, "icon_big_text")
end

function GalaxyTripMapTable:getIconMaskText(id)
	return self:getString(id, "icon_mask_text")
end

function GalaxyTripMapTable:getMapText(id)
	return self:getString(id, "map_text")
end

function GalaxyTripMapTable:getNameTextId(id)
	return self:getNumber(id, "name_text_id")
end

function GalaxyTripMapTable:getIntroTextId(id)
	return self:getNumber(id, "intro_text_id")
end

function GalaxyTripMapTable:getBeginSeason(id)
	return self:getNumber(id, "begin_season")
end

function GalaxyTripMapTable:getEvents(id)
	return self:split2Cost(id, "events", "|", true)
end

return GalaxyTripMapTable
