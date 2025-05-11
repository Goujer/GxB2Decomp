-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StarOriginNodeTable.lua

local StarOriginNodeTable = class("StarOriginNodeTable", import("app.common.tables.BaseTable"))

function StarOriginNodeTable:ctor()
	StarOriginNodeTable.super.ctor(self, "star_origin_node")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function StarOriginNodeTable:getIDs()
	return self.ids_
end

function StarOriginNodeTable:getPreId(id)
	return self:getNumber(id, "pre_id")
end

function StarOriginNodeTable:getPreLv(id)
	return self:getNumber(id, "pre_lv")
end

function StarOriginNodeTable:getOriginGroup(id)
	return self:getNumber(id, "origin_group")
end

function StarOriginNodeTable:getDesc(id)
	return self:getString(id, "desc")
end

function StarOriginNodeTable:getXy(id)
	return self:split2Cost(id, "xy", "|", true)
end

return StarOriginNodeTable
