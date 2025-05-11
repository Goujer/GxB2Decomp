-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressSlotTable.lua

local SenpaiDressSlotTable = class("SenpaiDressSlotTable", import("app.common.tables.BaseTable"))

function SenpaiDressSlotTable:ctor()
	SenpaiDressSlotTable.super.ctor(self, "senpai_dress_slot")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressSlotTable:getIDs()
	return self.ids_
end

function SenpaiDressSlotTable:getCanRm(id)
	return self:getNumber(id, "can_rm")
end

function SenpaiDressSlotTable:getDefaultStyle(id)
	return self:getNumber(id, "default_style")
end

return SenpaiDressSlotTable
