-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildNewWarMessageTable.lua

local GuildNewWarMessageTable = class("GuildNewWarMessageTable", import("app.common.tables.BaseTable"))

function GuildNewWarMessageTable:ctor()
	GuildNewWarMessageTable.super.ctor(self, "guild_new_war_message")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildNewWarMessageTable:getIDs()
	return self.ids_
end

function GuildNewWarMessageTable:getConnectType(id)
	return self:split2Cost(id, "connect_type", "|#", false)
end

return GuildNewWarMessageTable
