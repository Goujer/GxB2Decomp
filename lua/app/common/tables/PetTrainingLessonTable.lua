-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetTrainingLessonTable.lua

local PetTrainingLessonTable = class("PetTrainingLessonTable", import("app.common.tables.BaseTable"))

function PetTrainingLessonTable:ctor()
	PetTrainingLessonTable.super.ctor(self, "pet_training_lesson")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_, function(a, b)
		return a < b
	end)
end

function PetTrainingLessonTable:getIds()
	return self.ids_
end

function PetTrainingLessonTable:getTime(id)
	return self:getNumber(id, "time")
end

function PetTrainingLessonTable:getLev(id)
	return self:getNumber(id, "level")
end

function PetTrainingLessonTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function PetTrainingLessonTable:getRankUnlocked(id)
	return self:getNumber(id, "rank_unlocked")
end

return PetTrainingLessonTable
