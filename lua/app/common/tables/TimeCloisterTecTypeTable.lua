-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterTecTypeTable.lua

local TimeCloisterTecTypeTable = class("TimeCloisterTecTypeTable", import("app.common.tables.BaseTable"))

function TimeCloisterTecTypeTable:ctor()
	TimeCloisterTecTypeTable.super.ctor(self, "time_cloister_tec_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterTecTypeTable:getIDs()
	return self.ids_
end

return TimeCloisterTecTypeTable
