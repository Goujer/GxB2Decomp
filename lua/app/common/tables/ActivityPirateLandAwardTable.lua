-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPirateLandAwardTable.lua

local ActivityPirateLandAwardTable = class("ActivityPirateLandAwardTable", import("app.common.tables.BaseTable"))

function ActivityPirateLandAwardTable:ctor()
	ActivityPirateLandAwardTable.super.ctor(self, "activity_pirate_5_drop_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityPirateLandAwardTable:getDropBoxID(id)
	return self:getNumber(id, "dropbox_id")
end

return ActivityPirateLandAwardTable
