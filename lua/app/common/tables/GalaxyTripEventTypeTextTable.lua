-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripEventTypeTextTable.lua

local GalaxyTripEventTypeTextTable = class("GalaxyTripEventTypeTextTable", import("app.common.tables.BaseTable"))

function GalaxyTripEventTypeTextTable:ctor()
	GalaxyTripEventTypeTextTable.super.ctor(self, "galaxy_trip_event_type_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripEventTypeTextTable:getIDs()
	return self.ids_
end

function GalaxyTripEventTypeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GalaxyTripEventTypeTextTable
