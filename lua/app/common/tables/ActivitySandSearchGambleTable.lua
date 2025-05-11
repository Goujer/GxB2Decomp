-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySandSearchGambleTable.lua

local ActivitySandSearchGambleTable = class("ActivitySandSearchAwardTable", import("app.common.tables.BaseTable"))

function ActivitySandSearchGambleTable:ctor()
	ActivitySandSearchGambleTable.super.ctor(self, "activity_sand_gamble")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySandSearchGambleTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySandSearchGambleTable:getParams(id)
	return self:getNumber(id, "parameter")
end

return ActivitySandSearchGambleTable
