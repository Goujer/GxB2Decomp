-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressStyleTable.lua

local SenpaiDressStyleTable = class("SenpaiDressStyleTable", import("app.common.tables.BaseTable"))

function SenpaiDressStyleTable:ctor()
	SenpaiDressStyleTable.super.ctor(self, "senpai_dress_style")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressStyleTable:getIDs()
	return self.ids_
end

function SenpaiDressStyleTable:getDressId(id)
	return self:getNumber(id, "dress_id")
end

function SenpaiDressStyleTable:getImage(id)
	return self:getString(id, "image")
end

function SenpaiDressStyleTable:getResource(id)
	return self:getString(id, "resource")
end

function SenpaiDressStyleTable:getPos(id)
	return self:getNumber(id, "pos")
end

function SenpaiDressStyleTable:getSlot(id)
	return self:getString(id, "slot")
end

function SenpaiDressStyleTable:getOffset(id)
	return self:split2num(id, "offset", "|")
end

function SenpaiDressStyleTable:getScale(id)
	return self:split2num(id, "scale", "|")
end

function SenpaiDressStyleTable:getRotation(id)
	return self:getNumber(id, "rotation")
end

function SenpaiDressStyleTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function SenpaiDressStyleTable:getCollide(id)
	return self:getNumber(id, "collide")
end

return SenpaiDressStyleTable
