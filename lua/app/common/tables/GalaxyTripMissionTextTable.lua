-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripMissionTextTable.lua

local GalaxyTripMissionTextTable = class("GalaxyTripMissionTextTable", import("app.common.tables.BaseTable"))

function GalaxyTripMissionTextTable:ctor()
	GalaxyTripMissionTextTable.super.ctor(self, "galaxy_trip_mission_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripMissionTextTable:getIDs()
	return self.ids_
end

function GalaxyTripMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GalaxyTripMissionTextTable
