-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripBuffShowTextTable.lua

local GalaxyTripBuffShowTextTable = class("GalaxyTripBuffShowTextTable", import("app.common.tables.BaseTable"))

function GalaxyTripBuffShowTextTable:ctor()
	GalaxyTripBuffShowTextTable.super.ctor(self, "galaxy_trip_buff_show_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripBuffShowTextTable:getIDs()
	return self.ids_
end

function GalaxyTripBuffShowTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GalaxyTripBuffShowTextTable
