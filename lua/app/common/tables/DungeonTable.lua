-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DungeonTable.lua

local DungeonTable = class("DungeonTable", import("app.common.tables.BaseTable"))

function DungeonTable:ctor()
	DungeonTable.super.ctor(self, "dungeon")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end
end

function DungeonTable:getType(id)
	return self:getNumber(id, "type")
end

function DungeonTable:getMapSource(id)
	return self:getString(id, "map_source")
end

function DungeonTable:getMapScale(id)
	return self:getNumber(id, "map_scale")
end

function DungeonTable:getMapPosition(id)
	return self:split2num(id, "map_position", "|")
end

return DungeonTable
