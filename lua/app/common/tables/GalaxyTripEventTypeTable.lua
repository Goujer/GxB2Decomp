-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripEventTypeTable.lua

local GalaxyTripEventTypeTable = class("GalaxyTripEventTypeTable", import("app.common.tables.BaseTable"))

function GalaxyTripEventTypeTable:ctor()
	GalaxyTripEventTypeTable.super.ctor(self, "galaxy_trip_event_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripEventTypeTable:getIDs()
	return self.ids_
end

function GalaxyTripEventTypeTable:getType(id)
	return self:getNumber(id, "type")
end

function GalaxyTripEventTypeTable:getIconText(id)
	return self:getString(id, "icon_text")
end

function GalaxyTripEventTypeTable:getIconBigText(id)
	return self:getString(id, "icon_big_text")
end

function GalaxyTripEventTypeTable:getTime(id)
	return self:getNumber(id, "time")
end

function GalaxyTripEventTypeTable:getCost(id)
	return self:getNumber(id, "cost")
end

function GalaxyTripEventTypeTable:getNameTextId(id)
	return self:getNumber(id, "name_text_id")
end

function GalaxyTripEventTypeTable:getIntroTextId(id)
	return self:getNumber(id, "intro_text_id")
end

function GalaxyTripEventTypeTable:getSize(id)
	return self:split2Cost(id, "size", "|", true)
end

return GalaxyTripEventTypeTable
