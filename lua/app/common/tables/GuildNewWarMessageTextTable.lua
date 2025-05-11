-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildNewWarMessageTextTable.lua

local GuildNewWarMessageTextTable = class("GuildNewWarMessageTextTable", import("app.common.tables.BaseTable"))

function GuildNewWarMessageTextTable:ctor()
	GuildNewWarMessageTextTable.super.ctor(self, "guild_new_war_message_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildNewWarMessageTextTable:getIDs()
	return self.ids_
end

function GuildNewWarMessageTextTable:getDesc(id, ...)
	local formatStr = self:getString(id, "string")

	if not formatStr then
		return id
	end

	local args = {
		...
	}
	local result = xyd.stringFormat(formatStr, unpack(args))

	result = string.gsub(result, "undefined", "")

	return result
end

return GuildNewWarMessageTextTable
