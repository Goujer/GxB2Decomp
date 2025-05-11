-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotListTable.lua

local MainPlotListTable = class("MainPlotListTable", import("app.common.tables.BaseTable"))

function MainPlotListTable:ctor()
	MainPlotListTable.super.ctor(self, "main_plot_list")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local fortID = self:getPlotFortID(id)

		if not self.ids_[fortID] then
			self.ids_[fortID] = {}
		end

		table.insert(self.ids_[fortID], tonumber(id))
	end

	for i = 1, #self.ids_ do
		table.sort(self.ids_[i])
	end
end

function MainPlotListTable:getIDsByFortID(fortID)
	return self.ids_[fortID]
end

function MainPlotListTable:getStageID(id)
	return self:getNumber(id, "stage_id")
end

function MainPlotListTable:getFortID(id)
	return self:getString(id, "fort_id")
end

function MainPlotListTable:getPlotIDsByStageID(stage_id)
	local id = self:getIdByStageId(stage_id)

	return self:split2num(id, "plot_id", "#")
end

function MainPlotListTable:getPlotIDs(id)
	return self:split2num(id, "plot_id", "#")
end

function MainPlotListTable:getMemoryPlotId(id)
	return self:split2num(id, "memory_plot_id", "|")
end

function MainPlotListTable:getPlotFortID(id)
	return self:getNumber(id, "plot_fort_id")
end

function MainPlotListTable:getChapterIcon(id)
	return self:getString(id, "chapter_icon")
end

function MainPlotListTable:getUnlockCost(id)
	return self:split2num(id, "unlock", "#")
end

function MainPlotListTable:getUnlockFormerListID(id)
	return self:getNumber(id, "unlock_plot_list_id")
end

function MainPlotListTable:getActivityPlotId(id)
	return self:getNumber(id, "activity_plot_list_id")
end

function MainPlotListTable:getStroyType(id)
	return self:getNumber(id, "plot_text_table")
end

function MainPlotListTable:getIdByStageId(stageId)
	for i = 1, #self.ids_ do
		local ids = self.ids_[i]

		for j = 1, #ids do
			local id = ids[j]

			if self:getStageID(id) == stageId then
				return id
			end
		end
	end

	return 0
end

return MainPlotListTable
