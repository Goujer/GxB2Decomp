-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MainPlotEpisodeTextTable.lua

local MainPlotEpisodeTextTable = class("MainPlotEpisodeTextTable", import("app.common.tables.BaseTable"))

function MainPlotEpisodeTextTable:ctor()
	MainPlotEpisodeTextTable.super.ctor(self, "main_plot_episode_text_" .. string.lower(xyd.lang))
end

function MainPlotEpisodeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return MainPlotEpisodeTextTable
