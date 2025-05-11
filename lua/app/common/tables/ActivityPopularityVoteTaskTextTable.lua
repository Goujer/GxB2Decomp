-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPopularityVoteTaskTextTable.lua

local ActivityPopularityVoteTaskTextTable = class("ActivityPopularityVoteTaskTextTable", import("app.common.tables.BaseTable"))

function ActivityPopularityVoteTaskTextTable:ctor()
	ActivityPopularityVoteTaskTextTable.super.ctor(self, "activity_popularity_vote_text_" .. xyd.Global.lang)
end

function ActivityPopularityVoteTaskTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityPopularityVoteTaskTextTable
