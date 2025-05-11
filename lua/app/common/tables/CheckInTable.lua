-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CheckInTable.lua

local CheckInTable = class("CheckInTable", import("app.common.tables.BaseTable"))

function CheckInTable:ctor()
	CheckInTable.super.ctor(self, "activity_login")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function CheckInTable:getRewards(id)
	return self:split2Cost(id, "award", "#")
end

function CheckInTable:getBack(id)
	return self:getNumber(id, "special")
end

function CheckInTable:judgeDoubleAward(id)
	return self:getNumber(id, "double_award") == 1
end

function CheckInTable:getIDs()
	return self.ids_
end

return CheckInTable
