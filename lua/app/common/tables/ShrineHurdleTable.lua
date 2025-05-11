-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleTable.lua

local ShrineHurdleTable = class("ShrineHurdleTable", import("app.common.tables.BaseTable"))

function ShrineHurdleTable:ctor()
	ShrineHurdleTable.super.ctor(self, "shrine_hurdle")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ShrineHurdleTable:getIDs()
	return self.ids_
end

function ShrineHurdleTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function ShrineHurdleTable:getHurdle(id)
	local hurdle = self:split2num(id, "hurdle", "|")

	return hurdle
end

return ShrineHurdleTable
