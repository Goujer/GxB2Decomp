-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/EnhanceTable.lua

local EnhanceTable = class("EnhanceTable", import("app.common.tables.BaseTable"))

function EnhanceTable:ctor()
	EnhanceTable.super.ctor(self, "be_stronger")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		a = tonumber(a)
		b = tonumber(b)

		return a < b
	end)
end

function EnhanceTable:getIDs()
	return self.ids_
end

function EnhanceTable:getIcon(id)
	return self:getString(id, "icon")
end

function EnhanceTable:isGoto(id)
	return self:split2num(id, "is_goto", "|")
end

return EnhanceTable
