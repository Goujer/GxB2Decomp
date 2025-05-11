-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPiratePlotListTable.lua

local ActivityPiratePlotListTable = class("ActivityPiratePlotListTable", import("app.common.tables.BaseTable"))

function ActivityPiratePlotListTable:ctor()
	ActivityPiratePlotListTable.super.ctor(self, "activity_pirate_plot_list")

	self.ids_ = {}
	self.idsByType_ = {}
	self.place2id_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local mapType = self:getMapType(id)

		if not self.idsByType_[mapType] then
			self.idsByType_[mapType] = {}
		end

		table.insert(self.idsByType_[mapType], tonumber(id))

		local place_id = self:getPlaceID(id)

		if place_id then
			self.place2id_[place_id] = tonumber(id)
		end
	end

	table.sort(self.ids_)
end

function ActivityPiratePlotListTable:getIDs()
	return self.ids_
end

function ActivityPiratePlotListTable:getMapType(id)
	return self:getNumber(id, "type")
end

function ActivityPiratePlotListTable:getIdsByMapId(mapType)
	return self.idsByType_[mapType]
end

function ActivityPiratePlotListTable:getUnlockIDs(id)
	return self:split2num(id, "unlock_id", "|")
end

function ActivityPiratePlotListTable:getPlotIdById(id)
	return self:getNumber(id, "open_plot_id")
end

function ActivityPiratePlotListTable:getPlaceID(id)
	return self:getNumber(id, "place_id")
end

function ActivityPiratePlotListTable:getIconImg(id)
	return self:getString(id, "icon_image")
end

function ActivityPiratePlotListTable:getTextType(id)
	return self:getNumber(id, "text_type")
end

function ActivityPiratePlotListTable:getDisapperID(id)
	local disapperID = self:getNumber(id, "disappear_plot_id")

	if not disapperID or disapperID <= 0 then
		return id
	else
		return disapperID
	end
end

function ActivityPiratePlotListTable:getIdByPlace(place_id)
	return self.place2id_[place_id]
end

return ActivityPiratePlotListTable
