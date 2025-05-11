-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmDialogTable.lua

local ActivitySpfarmDialogTable = class("ActivitySpfarmDialogTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmDialogTable:ctor()
	ActivitySpfarmDialogTable.super.ctor(self, "activity_spfarm_dialog")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmDialogTable:getIDs()
	return self.ids_
end

function ActivitySpfarmDialogTable:getTime(id)
	return self:getNumber(id, "time")
end

function ActivitySpfarmDialogTable:getLevel(id)
	return self:getNumber(id, "level")
end

return ActivitySpfarmDialogTable
