-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotEpisodeTable.lua

local MainPlotEpisodeTable = class("MainPlotEpisodeTable", import("app.common.tables.BaseTable"))

function MainPlotEpisodeTable:ctor()
	MainPlotEpisodeTable.super.ctor(self, "main_plot_episode")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function MainPlotEpisodeTable:getIDs()
	return self.ids_
end

function MainPlotEpisodeTable:getDesc(id)
	return xyd.tables.mainPlotEpisodeTextTable:getDesc(id)
end

function MainPlotEpisodeTable:getImg(id)
	return self:getString(id, "episode_img")
end

return MainPlotEpisodeTable
