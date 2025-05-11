-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripBuffShowTable.lua

local GalaxyTripBuffShowTable = class("GalaxyTripBuffShowTable", import("app.common.tables.BaseTable"))

function GalaxyTripBuffShowTable:ctor()
	GalaxyTripBuffShowTable.super.ctor(self, "galaxy_trip_buff_show")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripBuffShowTable:getIDs()
	return self.ids_
end

function GalaxyTripBuffShowTable:getIcon(id)
	return self:getString(id, "icon")
end

function GalaxyTripBuffShowTable:getText1(id)
	return self:getNumber(id, "text1")
end

function GalaxyTripBuffShowTable:getText2(id)
	return self:getNumber(id, "text2")
end

return GalaxyTripBuffShowTable
