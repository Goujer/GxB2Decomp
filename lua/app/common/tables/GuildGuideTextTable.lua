-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildGuideTextTable.lua

local GuildGuideTextTable = class("GuildGuideTextTable", import("app.common.tables.BaseTable"))

function GuildGuideTextTable:ctor()
	GuildGuideTextTable.super.ctor(self, "guild_guide_text_" .. tostring(xyd.Global.lang))
end

function GuildGuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GuildGuideTextTable
