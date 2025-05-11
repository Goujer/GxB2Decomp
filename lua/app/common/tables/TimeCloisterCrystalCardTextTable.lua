-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterCrystalCardTextTable.lua

local TimeCloisterCrystalCardTextTable = class("TimeCloisterCrystalCardTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterCrystalCardTextTable:ctor()
	TimeCloisterCrystalCardTextTable.super.ctor(self, "time_cloister_crystal_card_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterCrystalCardTextTable:getIDs()
	return self.ids_
end

function TimeCloisterCrystalCardTextTable:getName(id)
	return self:getString(id, "name")
end

return TimeCloisterCrystalCardTextTable
