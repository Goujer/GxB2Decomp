-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DatesGiftTable.lua

local DatesGiftTable = class("DatesGiftTable", import("app.common.tables.BaseTable"))

function DatesGiftTable:ctor()
	DatesGiftTable.super.ctor(self, "dates_gifts")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end
end

function DatesGiftTable:getIDs()
	return self.ids_
end

function DatesGiftTable:getGroup(id)
	return self:getNumber(id, "group")
end

return DatesGiftTable
