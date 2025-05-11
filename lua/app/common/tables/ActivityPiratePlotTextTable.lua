-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPiratePlotTextTable.lua

local ActivityPiratePlotTextTable = class("ActivityPiratePlotTextTable", import("app.common.tables.BaseTable"))

function ActivityPiratePlotTextTable:ctor()
	ActivityPiratePlotTextTable.super.ctor(self, "activity_pirate_plot_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityPiratePlotTextTable:getIDs()
	return self.ids_
end

function ActivityPiratePlotTextTable:getTitle(id)
	return self:getString(id, "title")
end

function ActivityPiratePlotTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityPiratePlotTextTable:getDialog(id)
	return self:getString(id, "dialog")
end

function ActivityPiratePlotTextTable:getSelectText(id)
	return self:getString(id, "select_text")
end

return ActivityPiratePlotTextTable
