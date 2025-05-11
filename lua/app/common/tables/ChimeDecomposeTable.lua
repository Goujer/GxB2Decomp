-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ChimeDecomposeTable.lua

local ChimeDecomposeTable = class("ChimeDecomposeTable", import("app.common.tables.BaseTable"))

function ChimeDecomposeTable:ctor()
	ChimeDecomposeTable.super.ctor(self, "chime_decompose")

	self.ids_ = {}
	self.chimeIDToDebrisID = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local chimeID = tonumber(self:getChimeID(id))

		self.chimeIDToDebrisID[chimeID] = tonumber(id)
	end
end

function ChimeDecomposeTable:getIDs()
	return self.ids_
end

function ChimeDecomposeTable:getChimeID(id)
	return self:getNumber(id, "chime_id")
end

function ChimeDecomposeTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ChimeDecomposeTable:getDebrisIDByChimeID(chimeID)
	return self.chimeIDToDebrisID[chimeID]
end

return ChimeDecomposeTable
