-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripStoreTextTable.lua

local GalaxyTripStoreTextTable = class("GalaxyTripStoreTextTable", import("app.common.tables.BaseTable"))

function GalaxyTripStoreTextTable:ctor()
	GalaxyTripStoreTextTable.super.ctor(self, "galaxy_trip_store_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripStoreTextTable:getIDs()
	return self.ids_
end

function GalaxyTripStoreTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GalaxyTripStoreTextTable
