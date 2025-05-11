-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildIconTable.lua

local GuildIconTable = class("GuildIconTable", import("app.common.tables.BaseTable"))

function GuildIconTable:ctor()
	GuildIconTable.super.ctor(self, "guild_flag")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end
end

function GuildIconTable:getIDs()
	return self.ids_
end

function GuildIconTable:getIcon(id)
	return self:getString(id, "picture")
end

return GuildIconTable
