-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildSkillTextTable.lua

local GuildSkillTextTable = class("GuildSkillTextTable", import("app.common.tables.BaseTable"))

function GuildSkillTextTable:ctor()
	GuildSkillTextTable.super.ctor(self, "guild_skill_text_" .. tostring(xyd.Global.lang))
end

function GuildSkillTextTable:getName(id)
	return self:getString(id, "name")
end

return GuildSkillTextTable
