-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaAllServerRobotTable.lua

local ArenaAllServerRobotTable = class("ArenaAllServerRobotTable", import("app.common.tables.BaseTable"))

function ArenaAllServerRobotTable:ctor()
	ArenaAllServerRobotTable.super.ctor(self, "arena_all_server_robot")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ArenaAllServerRobotTable:getName(id)
	return self:getString(id, "name")
end

function ArenaAllServerRobotTable:getLev(id)
	return self:getNumber(id, "lv")
end

function ArenaAllServerRobotTable:getPower(id)
	return self:getNumber(id, "power")
end

function ArenaAllServerRobotTable:getShowID(id)
	return self:getNumber(id, "show_id")
end

function ArenaAllServerRobotTable:getAvatar(id)
	return self:getNumber(id, "avatar_id")
end

function ArenaAllServerRobotTable:getServerID(id)
	return self:getNumber(id, "server")
end

function ArenaAllServerRobotTable:getPartners(id)
	return self:split2Cost(id, "partner_ids", "|")
end

function ArenaAllServerRobotTable:getScore(id)
	return self:getNumber(id, "score")
end

return ArenaAllServerRobotTable
