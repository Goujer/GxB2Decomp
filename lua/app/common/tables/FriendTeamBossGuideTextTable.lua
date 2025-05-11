-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossGuideTextTable.lua

local FriendTeamBossGuideTextTable = class("FriendTeamBossGuideTextTable", import("app.common.tables.BaseTable"))

function FriendTeamBossGuideTextTable:ctor()
	FriendTeamBossGuideTextTable.super.ctor(self, "govern_guide_text_" .. tostring(xyd.Global.lang))
end

function FriendTeamBossGuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return FriendTeamBossGuideTextTable
