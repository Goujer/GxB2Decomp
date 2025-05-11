-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineMissionTable.lua

local ShrineMissionTable = class("ShrineMissionTable", import("app.common.tables.BaseTable"))

function ShrineMissionTable:ctor()
	ShrineMissionTable.super.ctor(self, "shrine_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ShrineMissionTable:getIds()
	return self.ids_
end

function ShrineMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ShrineMissionTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ShrineMissionTable:getDesc(id)
	local desc = xyd.tables.shrineMissionTextTable:getDesc(id)

	if id <= 3 then
		local routeName = xyd.models.shrine:getRankName(id)

		desc = string.gsub(desc, "{1}", routeName)
	end

	return desc
end

function ShrineMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ShrineMissionTable:getType2(id)
	return self:getNumber(id, "type2")
end

return ShrineMissionTable
