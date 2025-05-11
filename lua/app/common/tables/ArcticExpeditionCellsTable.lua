-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionCellsTable.lua

local ArcticExpeditionCellsTable = class("ArcticExpeditionCellsTable", import(".BaseTable"))

function ArcticExpeditionCellsTable:ctor()
	ArcticExpeditionCellsTable.super.ctor(self, "activity_ept_cells")

	self.ids_ = {}
	self.cellPosList_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local pos = self:getCellPos(id)

		if not self.cellPosList_[pos[2]] then
			self.cellPosList_[pos[2]] = {}
		end

		self.cellPosList_[pos[2]][pos[1]] = id

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArcticExpeditionCellsTable:getCellPos(id)
	return self:split2Cost(id, "cell_xy", "|", true)
end

function ArcticExpeditionCellsTable:getCellGroup(id)
	return self:getNumber(id, "group_id")
end

function ArcticExpeditionCellsTable:getCellType(id)
	return self:getNumber(id, "type_id")
end

function ArcticExpeditionCellsTable:getIds()
	return self.ids_
end

function ArcticExpeditionCellsTable:getCellIDByPos(x, y)
	if not self.cellPosList_[y] then
		return 0
	end

	return self.cellPosList_[y][x] or 0
end

function ArcticExpeditionCellsTable:getCellAroud1(pos, list)
	local x = pos[1]
	local y = pos[2]
	local posAdd = 0

	posAdd = y % 2 == 0 and 0 or -1

	local cell_list = {}

	cell_list.cell_id1 = self:getCellIDByPos(x - 1, y)
	cell_list.cell_id2 = self:getCellIDByPos(x + 1, y)
	cell_list.cell_id3 = self:getCellIDByPos(x + posAdd, y + 1)
	cell_list.cell_id4 = self:getCellIDByPos(x + 1 + posAdd, y + 1)
	cell_list.cell_id5 = self:getCellIDByPos(x + posAdd, y - 1)
	cell_list.cell_id6 = self:getCellIDByPos(x + 1 + posAdd, y - 1)

	for i = 1, 6 do
		if not list[cell_list["cell_id" .. i]] then
			list[cell_list["cell_id" .. i]] = 1
		end
	end
end

return ArcticExpeditionCellsTable
