-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExploreBreadHomeTable.lua

local ExploreBreadHomeTable = class("ExploreBreadHomeTable", import(".BaseTable"))

function ExploreBreadHomeTable:ctor()
	ExploreBreadHomeTable.super.ctor(self, "travel_building3")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ExploreBreadHomeTable:getIds()
	return self.ids_
end

function ExploreBreadHomeTable:getOutput(id)
	return self:split(id, "out_put", "#")
end

function ExploreBreadHomeTable:getStayMax(id)
	return self:getNumber(id, "stay_max")
end

function ExploreBreadHomeTable:getLevelUpCost(id)
	return self:split2Cost(id, "update", "|#")
end

return ExploreBreadHomeTable
