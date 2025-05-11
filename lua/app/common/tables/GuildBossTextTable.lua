-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildBossTextTable.lua

local GuildBossTextTable = class("GuildBossTextTable", import("app.common.tables.BaseTable"))

function GuildBossTextTable:ctor()
	GuildBossTextTable.super.ctor(self, "guild_boss_text_" .. tostring(xyd.Global.lang))
end

function GuildBossTextTable:getShowWord(id)
	return self:getString(id, "show_word")
end

return GuildBossTextTable
