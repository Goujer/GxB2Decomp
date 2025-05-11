-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetTrainingTextTable.lua

PetTrainingTextTable = class("PetTrainingTextTable", import("app.common.tables.BaseTable"))

function PetTrainingTextTable:ctor()
	PetTrainingTextTable.super.ctor(self, "pet_training_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function PetTrainingTextTable:getIDs()
	return self.ids_
end

function PetTrainingTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function PetTrainingTextTable:getBoss(id)
	return self:getString(id, "boss")
end

return PetTrainingTextTable
