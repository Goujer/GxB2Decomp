-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewyearWelfareTable.lua

local NewyearWelfareTable = class("NewyearWelfareTable", import("app.common.tables.BaseTable"))

function NewyearWelfareTable:ctor()
	NewyearWelfareTable.super.ctor(self, "activity_newyear_welfare")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function NewyearWelfareTable:getIds(id)
	return self.ids_
end

function NewyearWelfareTable:getType(id)
	return self:getNumber(id, "type")
end

function NewyearWelfareTable:getAward(id)
	return self:split2Cost(id, "item", "#")
end

function NewyearWelfareTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function NewyearWelfareTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return NewyearWelfareTable
