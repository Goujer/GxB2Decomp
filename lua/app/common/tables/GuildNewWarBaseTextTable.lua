-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildNewWarBaseTextTable.lua

local GuildNewWarBaseTextTable = class("GuildNewWarBaseTextTable", import("app.common.tables.BaseTable"))

function GuildNewWarBaseTextTable:ctor()
	GuildNewWarBaseTextTable.super.ctor(self, "guild_new_war_base_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildNewWarBaseTextTable:getIDs()
	return self.ids_
end

function GuildNewWarBaseTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GuildNewWarBaseTextTable
