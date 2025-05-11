-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetTrainingTable.lua

local PetTrainingTable = class("PetTrainingTable", import("app.common.tables.BaseTable"))

function PetTrainingTable:ctor()
	PetTrainingTable.super.ctor(self, "pet_training")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function PetTrainingTable:getIds()
	return self.ids_
end

function PetTrainingTable:getExp(id)
	return self:getNumber(id, "exp")
end

return PetTrainingTable
