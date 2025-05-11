-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossIconTable.lua

local FriendTeamBossIconTable = class("FriendTeamBossIconTable", import("app.common.tables.BaseTable"))

function FriendTeamBossIconTable:ctor()
	FriendTeamBossIconTable.super.ctor(self, "govern_flag")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function FriendTeamBossIconTable:getIDs()
	return self.ids_
end

function FriendTeamBossIconTable:getIcon(id)
	return self:getString(id, "picture")
end

return FriendTeamBossIconTable
