-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossAwardTable.lua

local FriendTeamBossAwardTable = class("FriendTeamBossAwardTable", import("app.common.tables.BaseTable"))

function FriendTeamBossAwardTable:ctor()
	FriendTeamBossAwardTable.super.ctor(self, "govern_team_award")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function FriendTeamBossAwardTable:getIDs()
	return self.ids_
end

function FriendTeamBossAwardTable:getDownAward(id)
	return self:splitAward(self:getString(id, "downgrade_award"))
end

function FriendTeamBossAwardTable:getRelegationAward(id)
	return self:splitAward(self:getString(id, "relegation_award"))
end

function FriendTeamBossAwardTable:getUpAward(id)
	return self:splitAward(self:getString(id, "upgrade_award"))
end

function FriendTeamBossAwardTable:splitAward(str)
	if not str then
		return {}
	end

	local arr1 = xyd.split(str, "|")
	local arr2 = {}

	for i = 1, #arr1 do
		table.insert(arr2, xyd.split(arr1[i], "#", true))
	end

	return arr2
end

return FriendTeamBossAwardTable
