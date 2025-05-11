-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendBossHelpAwardTable.lua

local FriendBossHelpAwardTable = class("FriendBossHelpAwardTable", import("app.common.tables.BaseTable"))

function FriendBossHelpAwardTable:ctor()
	FriendBossHelpAwardTable.super.ctor(self, "friend_boss_help_award")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function FriendBossHelpAwardTable:getIDs()
	return self.ids_
end

function FriendBossHelpAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function FriendBossHelpAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function FriendBossHelpAwardTable:getAssistNum(id)
	return self:getNumber(id, "help_times")
end

return FriendBossHelpAwardTable
