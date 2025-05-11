-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildLogTextTable.lua

local GuildLogTextTable = class("GuildLogTextTable", import("app.common.tables.BaseTable"))

function GuildLogTextTable:ctor()
	GuildLogTextTable.super.ctor(self, "guild_log_text_" .. tostring(xyd.Global.lang))
end

function GuildLogTextTable:translate(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, "text")

	if not formatStr then
		return id
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return GuildLogTextTable
