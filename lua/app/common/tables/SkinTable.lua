-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SkinTable.lua

local SkinTable = class("SkinTable", import("app.common.tables.BaseTable"))

function SkinTable:ctor()
	SkinTable.super.ctor(self, "skin")

	self.skin_ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.skin_ids_, self:getSkinId(id))
	end
end

function SkinTable:checkInTable(id)
	local ind = self:indexOf(self.skin_ids_, id)

	if ind == -1 then
		return false
	end

	return true
end

function SkinTable:getSkinId(id)
	return self:getNumber(id, "skin_id")
end

function SkinTable:getSum(id)
	return self:getNumber(id, "unlock_value_sum")
end

return SkinTable
