-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPlotListTable.lua

local ActivityPlotListTable = class("ActivityPlotListTable", import("app.common.tables.BaseTable"))

function ActivityPlotListTable:ctor()
	ActivityPlotListTable.super.ctor(self, "activity_plot_list")

	self.ids_ = {}
	self.idsByFort_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local fort_id = tonumber(self:getFortId(id))

		if not self.idsByFort_[fort_id] then
			self.idsByFort_[fort_id] = {}
		end

		table.insert(self.idsByFort_[fort_id], tonumber(id))
	end

	for i = 1, #self.idsByFort_ do
		table.sort(self.idsByFort_[i])
	end
end

function ActivityPlotListTable:getIds()
	return self.ids_
end

function ActivityPlotListTable:getIdsByFort(fort_id)
	return self.idsByFort_[fort_id]
end

function ActivityPlotListTable:getFortId(id)
	return self:getNumber(id, "fort_id")
end

function ActivityPlotListTable:getPlotIDs(id)
	return self:split2num(id, "plot_id", "#")
end

function ActivityPlotListTable:getChapterIcon(id)
	return self:getString(id, "chapter_icon")
end

function ActivityPlotListTable:getUnlockCost(id)
	return self:split2num(id, "unlock", "#")
end

function ActivityPlotListTable:getMemoryPlotId(id)
	return self:split2num(id, "memory_plot_id", "|")
end

function ActivityPlotListTable:getUnlockFormerListID(id)
	return self:getNumber(id, "unlock_plot_list_id")
end

function ActivityPlotListTable:getStroyType(id)
	return self:getNumber(id, "plot_text_table")
end

function ActivityPlotListTable:checkIsShow(id)
	local flag = self:getNumber(id, "is_show") or 0

	if flag == 1 then
		return true
	else
		return false
	end
end

function ActivityPlotListTable:getRedMarkTime(id)
	return self:getNumber(id, "red_mark_time") or 0
end

return ActivityPlotListTable
