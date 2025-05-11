-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetTrainingLessonTextTable.lua

PetTrainingLessonTextTable = class("PetTrainingLessonTextTable", import("app.common.tables.BaseTable"))

function PetTrainingLessonTextTable:ctor()
	PetTrainingLessonTextTable.super.ctor(self, "pet_training_lesson_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function PetTrainingLessonTextTable:getIDs()
	return self.ids_
end

function PetTrainingLessonTextTable:getName(id)
	return self:getString(id, "name")
end

return PetTrainingLessonTextTable
