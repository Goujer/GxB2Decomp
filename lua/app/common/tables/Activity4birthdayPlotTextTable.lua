-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4birthdayPlotTextTable.lua

local Activity4birthdayPlotTextTable = class("Activity4birthdayPlotTextTable", import("app.common.tables.BaseTable"))

function Activity4birthdayPlotTextTable:ctor()
	Activity4birthdayPlotTextTable.super.ctor(self, "activity_4birthday_plot_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity4birthdayPlotTextTable:getIDs()
	return self.ids_
end

function Activity4birthdayPlotTextTable:getTitle(id)
	return self:getString(id, "title")
end

function Activity4birthdayPlotTextTable:getName(id)
	return self:getString(id, "name")
end

function Activity4birthdayPlotTextTable:getDialog(id)
	return self:getString(id, "dialog")
end

function Activity4birthdayPlotTextTable:getSelectText(id)
	return self:getString(id, "select_text")
end

return Activity4birthdayPlotTextTable
