-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripMapTextTable.lua

local GalaxyTripMapTextTable = class("GalaxyTripMapTextTable", import("app.common.tables.BaseTable"))

function GalaxyTripMapTextTable:ctor()
	GalaxyTripMapTextTable.super.ctor(self, "galaxy_trip_map_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripMapTextTable:getIDs()
	return self.ids_
end

function GalaxyTripMapTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GalaxyTripMapTextTable
