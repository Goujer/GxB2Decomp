-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionEraTable.lua

local ArcticExpeditionEraTable = class("ArcticExpeditionEraTable", import(".BaseTable"))

function ArcticExpeditionEraTable:ctor()
	ArcticExpeditionEraTable.super.ctor(self, "activity_ept_era")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArcticExpeditionEraTable:getWinLimit(id)
	return self:getNumber(id, "win_limit")
end

function ArcticExpeditionEraTable:getArcticJson2Table(jsonName)
	local table
	local switch = {
		activity_ept_cell_type_text = function()
			table = xyd.tables.arcticExpeditionCellsTypeTextTable
		end,
		activity_ept_cells = function()
			table = xyd.tables.arcticExpeditionCellsTable
		end,
		activity_ept_era = function()
			table = xyd.tables.arcticExpeditionEraTable
		end,
		activity_ept_era_text = function()
			table = xyd.tables.arcticExpeditionEraTextTable
		end,
		translation = function()
			table = xyd.tables.translationTable
		end
	}

	if switch[jsonName] then
		switch[jsonName]()
	end

	return table
end

return ArcticExpeditionEraTable
