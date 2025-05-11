-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetStoryTable.lua

local PetStoryTable = class("PetStoryTable", import("app.common.tables.BaseTable"))

function PetStoryTable:ctor()
	PetStoryTable.super.ctor(self, "pet_story")

	local colIndexTable = self.TableLua.keys

	for _, v in pairs(self.TableLua.rows) do
		table.insert(self.ids_, v[colIndexTable.id])
	end
end

function PetStoryTable:getIds()
	return self.ids_
end

function PetStoryTable:getPetId(id)
	return self:getNumber(id, "pet_id")
end

function PetStoryTable:getUnLockValue(id)
	return self:getNumber(id, "unlock_value")
end

return PetStoryTable
