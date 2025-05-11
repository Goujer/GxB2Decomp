-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetTrainingBossTable.lua

local PetTrainingBossTable = class("PetTrainingBossTable", import("app.common.tables.BaseTable"))

function PetTrainingBossTable:ctor()
	PetTrainingBossTable.super.ctor(self, "pet_training_boss")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function PetTrainingBossTable:getIds()
	return self.ids_
end

function PetTrainingBossTable:getLevel(id)
	return self:getNumber(id, "level")
end

function PetTrainingBossTable:getBattleAwards(id)
	return self:split2Cost(id, "battle_awards", "|#")
end

function PetTrainingBossTable:getFinalAwards(id)
	return self:split2Cost(id, "final_awards", "|#")
end

function PetTrainingBossTable:getHp(id)
	return self:getNumber(id, "hp")
end

return PetTrainingBossTable
