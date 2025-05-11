-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TowerTable.lua

local TowerTable = class("TowerTable", import("app.common.tables.BaseTable"))

function TowerTable:ctor()
	TowerTable.super.ctor(self, "tower")
end

function TowerTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function TowerTable:getReward(id)
	local arr = xyd.split(self:getString(id, "reward"), "|")
	local res = {}

	for k, v in ipairs(arr) do
		local t = xyd.split(v, "#", true)

		table.insert(res, t)
	end

	return res
end

function TowerTable:getBattlePower(id)
	return self:getNumber(id, "power")
end

return TowerTable
