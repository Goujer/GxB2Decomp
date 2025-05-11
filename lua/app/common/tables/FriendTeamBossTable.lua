-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossTable.lua

local FriendTeamBossTable = class("FriendTeamBossTable", import("app.common.tables.BaseTable"))

function FriendTeamBossTable:ctor()
	FriendTeamBossTable.super.ctor(self, "govern_team")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end
end

function FriendTeamBossTable:getIDs()
	return self.ids_
end

function FriendTeamBossTable:getBossHp(id, index)
	return self:getNumber(id, "monster" .. tostring(index) .. "_hp")
end

function FriendTeamBossTable:getBossAvatar(id, index)
	return self:getString(id, "monster" .. tostring(index) .. "_avater")
end

function FriendTeamBossTable:getBossDesc(id, index)
	return self:getString(id, "monster" .. tostring(index) .. "_misc")
end

function FriendTeamBossTable:getBossSkillDesc(id, index)
	local result = {}
	local skills = xyd.split(self:getString(id, "monster" .. tostring(index) .. "_skill"), "#")

	do
		local i = 0

		while i < skills.length do
			local data = xyd.split(skills[i], "|")

			table.insert(result, data)

			i = i + 1
		end
	end

	return result
end

function FriendTeamBossTable:getBossSkill(id, index)
	return xyd.split(self:getString(id, "monster" .. tostring(index) .. "_skill_id"), "|", true)
end

function FriendTeamBossTable:getBossPos(id, index)
	local xy = {
		x = 0,
		y = 0
	}
	local res = xyd.split(self:getString(id, "monster" .. tostring(index) .. "_xy"), "|", true)

	xy.x = res[1]
	xy.y = res[2]

	return xy
end

return FriendTeamBossTable
