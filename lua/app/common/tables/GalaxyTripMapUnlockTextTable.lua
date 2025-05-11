-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripMapUnlockTextTable.lua

local GalaxyTripMapUnlockTextTable = class("GalaxyTripMapUnlockTextTable", import("app.common.tables.BaseTable"))

function GalaxyTripMapUnlockTextTable:ctor()
	GalaxyTripMapUnlockTextTable.super.ctor(self, "galaxy_trip_map_unlock_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripMapUnlockTextTable:getIDs()
	return self.ids_
end

function GalaxyTripMapUnlockTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GalaxyTripMapUnlockTextTable
