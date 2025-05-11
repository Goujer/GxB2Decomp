-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripMapUnlockTable.lua

local GalaxyTripMapUnlockTable = class("GalaxyTripMapUnlockTable", import("app.common.tables.BaseTable"))

function GalaxyTripMapUnlockTable:ctor()
	GalaxyTripMapUnlockTable.super.ctor(self, "galaxy_trip_map_unlock")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripMapUnlockTable:getIDs()
	return self.ids_
end

function GalaxyTripMapUnlockTable:getDesc(id)
	return self:getString(id, "desc")
end

function GalaxyTripMapUnlockTable:getType(id)
	return self:getNumber(id, "type")
end

function GalaxyTripMapUnlockTable:getEventTypeId(id)
	return self:getNumber(id, "event_type_id")
end

function GalaxyTripMapUnlockTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function GalaxyTripMapUnlockTable:getTextId(id)
	return self:getNumber(id, "text_id")
end

return GalaxyTripMapUnlockTable
