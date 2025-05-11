-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DirectMonsterTable.lua

local BaseTable = import(".BaseTable")
local DirectMonsterTable = class("DirectMonsterTable", BaseTable)

function DirectMonsterTable:ctor()
	DirectMonsterTable.super.ctor(self, "direct_monster")

	self.ids = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function DirectMonsterTable:getIds()
	return self.ids
end

function DirectMonsterTable:getMonsterId(id)
	return self:getNumber(id, "monster_id")
end

function DirectMonsterTable:getType(id)
	return self:getNumber(id, "type")
end

return DirectMonsterTable
