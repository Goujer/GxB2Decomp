-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4birthdayStoryTable.lua

local Activity4birthdayStoryTable = class("Activity4birthdayStoryTable", import("app.common.tables.BaseTable"))

function Activity4birthdayStoryTable:ctor()
	Activity4birthdayStoryTable.super.ctor(self, "activity_4birthday_story")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity4birthdayStoryTable:getIDs()
	return self.ids_
end

function Activity4birthdayStoryTable:getDay(id)
	return self:getNumber(id, "day")
end

function Activity4birthdayStoryTable:getBeginPlotId(id)
	return self:getNumber(id, "begin_plot_id")
end

function Activity4birthdayStoryTable:getFinishPlotId(id)
	return self:getNumber(id, "finish_plot_id")
end

return Activity4birthdayStoryTable
