-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripTeamTextTable.lua

local GalaxyTripTeamTextTable = class("GalaxyTripTeamTextTable", import("app.common.tables.BaseTable"))

function GalaxyTripTeamTextTable:ctor()
	GalaxyTripTeamTextTable.super.ctor(self, "galaxy_trip_team_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripTeamTextTable:getIDs()
	return self.ids_
end

function GalaxyTripTeamTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GalaxyTripTeamTextTable
