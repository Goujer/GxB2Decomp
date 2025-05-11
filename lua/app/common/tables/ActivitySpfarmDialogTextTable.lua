-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmDialogTextTable.lua

local ActivitySpfarmDialogTextTable = class("ActivitySpfarmDialogTextTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmDialogTextTable:ctor()
	ActivitySpfarmDialogTextTable.super.ctor(self, "activity_spfarm_dialog_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmDialogTextTable:getIDs()
	return self.ids_
end

function ActivitySpfarmDialogTextTable:getContent(id)
	return self:getString(id, "content")
end

return ActivitySpfarmDialogTextTable
