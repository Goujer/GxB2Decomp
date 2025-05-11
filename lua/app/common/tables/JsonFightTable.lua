-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/JsonFightTable.lua

local JsonFightTable = class("JsonFightTable", import("app.common.tables.BaseTable"))

function JsonFightTable:ctor()
	JsonFightTable.super.ctor(self, "json_fight")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function JsonFightTable:getIDs()
	return self.ids_
end

function JsonFightTable:getConditions(id)
	return self:split2Cost(id, "conditions", "|")
end

function JsonFightTable:getNotRun(id)
	return self:getNumber(id, "not_run")
end

function JsonFightTable:getDesc(id)
	return self:getString(id, "desc")
end

function JsonFightTable:getName(id)
	return self:getString(id, "name")
end

return JsonFightTable
