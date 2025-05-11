-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendRankTable.lua

local FriendRankTable = class("FriendRankTable", import("app.common.tables.BaseTable"))

function FriendRankTable:ctor()
	FriendRankTable.super.ctor(self, "friend_rank")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end
end

function FriendRankTable:getIDs()
	return self.ids_
end

function FriendRankTable:getrank(id)
	return self:getNumber(id, "rank")
end

function FriendRankTable:getAwards(id)
	local awards = self:split(id, "awards", "|")

	return awards
end

return FriendRankTable
