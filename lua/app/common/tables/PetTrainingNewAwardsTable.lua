-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetTrainingNewAwardsTable.lua

local PetTrainingNewAwardsTable = class("PetTrainingNewAwardsTable", import("app.common.tables.BaseTable"))

function PetTrainingNewAwardsTable:ctor()
	PetTrainingNewAwardsTable.super.ctor(self, "pet_training_new_awards")
	self:parseTable(nil, true)
end

function PetTrainingNewAwardsTable:getAward(id, pos)
	return self:split2Cost(id, "awards" .. pos, "#", true)
end

function PetTrainingNewAwardsTable:getTime(id)
	return self:getNumber(id, "time")
end

function PetTrainingNewAwardsTable:getDesc(id)
	return self:getNumber(id, "desc")
end

function PetTrainingNewAwardsTable:getIds()
	return self.ids_
end

return PetTrainingNewAwardsTable
