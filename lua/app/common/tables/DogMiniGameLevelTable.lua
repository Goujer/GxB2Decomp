-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DogMiniGameLevelTable.lua

local DogMiniGameLevelTable = class("DogMiniGameLevelTable", import("app.common.tables.BaseTable"))

function DogMiniGameLevelTable:ctor()
	DogMiniGameLevelTable.super.ctor(self, "dog_mini_game_level")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DogMiniGameLevelTable:getIDs()
	return self.ids_
end

function DogMiniGameLevelTable:getBeeHouse(id)
	return self:split2Cost(id, "bee_house", "|#", true)
end

function DogMiniGameLevelTable:getDog(id)
	return self:split2Cost(id, "dog", "|#", true)
end

function DogMiniGameLevelTable:getBorder(id)
	return self:split2Cost(id, "border", "|#", true)
end

function DogMiniGameLevelTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function DogMiniGameLevelTable:getStageId(id)
	return self:getNumber(id, "stage_id")
end

function DogMiniGameLevelTable:getBeeLastY(id)
	return self:getNumber(id, "bee_last_y")
end

return DogMiniGameLevelTable
