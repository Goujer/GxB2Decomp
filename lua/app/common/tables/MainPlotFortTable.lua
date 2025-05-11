-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotFortTable.lua

local MainPlotFortTable = class("MainPlotFortTable", import("app.common.tables.BaseTable"))

function MainPlotFortTable:ctor()
	MainPlotFortTable.super.ctor(self, "main_plot_fort")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local episodeID = self:getEpisodeID(id)

		if not self.ids_[episodeID] then
			self.ids_[episodeID] = {}
		end

		table.insert(self.ids_[episodeID], tonumber(id))
	end

	for i = 1, #self.ids_ do
		table.sort(self.ids_[i])
	end
end

function MainPlotFortTable:getIDsByEpisodeID(episodeID)
	return self.ids_[episodeID]
end

function MainPlotFortTable:getEpisodeID(id)
	return self:getNumber(id, "episode_id")
end

function MainPlotFortTable:getImg(id)
	return self:getString(id, "chapter_icon")
end

return MainPlotFortTable
