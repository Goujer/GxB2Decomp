-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendBossTable.lua

local FriendBossTable = class("FriendBossTable", import("app.common.tables.BaseTable"))

function FriendBossTable:ctor()
	FriendBossTable.super.ctor(self, "friend_boss_new")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function FriendBossTable:getIDs()
	return self.ids_
end

function FriendBossTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function FriendBossTable:getFinalAward(id)
	return self:split2num(id, "final_award", "#")
end

function FriendBossTable:getHp(id)
	return self:getNumber(id, "hp")
end

function FriendBossTable:getMonsterHp(id)
	return self:split2num(id, "monster_hp", "|")
end

return FriendBossTable
