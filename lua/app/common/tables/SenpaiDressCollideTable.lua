-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressCollideTable.lua

local SenpaiDressCollideTable = class("SenpaiDressCollideTable", import("app.common.tables.BaseTable"))

function SenpaiDressCollideTable:ctor()
	SenpaiDressCollideTable.super.ctor(self, "senpai_dress_collide")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressCollideTable:getIDs()
	return self.ids_
end

function SenpaiDressCollideTable:getCollide(id)
	return self:split2Cost(id, "collide", "|")
end

return SenpaiDressCollideTable
