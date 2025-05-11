-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaRobotTable.lua

local ArenaRobotTable = class("ArenaRobotTable", import("app.common.tables.BaseTable"))

function ArenaRobotTable:ctor()
	ArenaRobotTable.super.ctor(self, "arena_robot")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ArenaRobotTable:getName(id)
	return self:getString(id, "name")
end

function ArenaRobotTable:getLev(id)
	return self:getNumber(id, "lv")
end

function ArenaRobotTable:getPower(id)
	return self:getNumber(id, "power")
end

function ArenaRobotTable:getShowID(id)
	return self:getNumber(id, "show_id")
end

function ArenaRobotTable:getFormation(id)
	local items = xyd.split(self:getString(id, "partner_ids"), "|", true)
	local levs = xyd.split(self:getString(id, "partner_lv"), "|", true)
	local result = {}

	for i = 1, #items do
		local item = {
			partner_id = items[i],
			pos = i,
			lev = levs[i]
		}

		table.insert(result, item)
	end

	return result
end

function ArenaRobotTable:getAvatar(id)
	return self:getNumber(id, "avatar_id")
end

return ArenaRobotTable
