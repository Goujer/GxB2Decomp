-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattleTable.lua

local BattleTable = class("BattleTable", import("app.common.tables.BaseTable"))

function BattleTable:ctor()
	BattleTable.super.ctor(self, "battle")
end

function BattleTable:getMonsters(id)
	return xyd.split(self:getString(id, "monsters"), "|", true)
end

function BattleTable:getStands(id)
	return xyd.split(self:getString(id, "stands"), "|", true)
end

function BattleTable:getMap(id)
	if id == 1 then
		return {
			"battle_map_2_1"
		}
	end

	return self:split(id, "map", "|")
end

function BattleTable:getBossMap(id)
	return self:getString(id, "boss_map")
end

function BattleTable:getBossMapXy(id)
	local xy = self:getString(id, "boss_map_xy")

	if xy and xy ~= "" then
		return xyd.split(xy, "|", true)
	end

	return {
		0,
		0
	}
end

function BattleTable:getBossMapScale(id)
	local scale = self:getString(id, "boss_map_scale")

	if scale and scale ~= "" then
		return xyd.split(scale, "|", true)
	end

	return {
		1000,
		1559
	}
end

return BattleTable
