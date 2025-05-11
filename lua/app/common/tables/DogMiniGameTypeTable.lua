-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DogMiniGameTypeTable.lua

local DogMiniGameTypeTable = class("DogMiniGameTypeTable", import("app.common.tables.BaseTable"))

function DogMiniGameTypeTable:ctor()
	DogMiniGameTypeTable.super.ctor(self, "dog_mini_game_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DogMiniGameTypeTable:getIDs()
	return self.ids_
end

function DogMiniGameTypeTable:getType(id)
	return self:getNumber(id, "type")
end

function DogMiniGameTypeTable:getImage(id)
	return self:getString(id, "image")
end

function DogMiniGameTypeTable:getScaleX(id)
	return self:getNumber(id, "scale_x")
end

function DogMiniGameTypeTable:getIsDeath(id)
	return self:getNumber(id, "is_death")
end

function DogMiniGameTypeTable:getBeeNum(id)
	return self:getNumber(id, "bee_num")
end

function DogMiniGameTypeTable:getAngle(id)
	return self:getNumber(id, "angle")
end

function DogMiniGameTypeTable:getObjName(id)
	return self:getString(id, "obj_name")
end

function DogMiniGameTypeTable:getSize(id)
	return self:split2Cost(id, "size", "|", true)
end

return DogMiniGameTypeTable
