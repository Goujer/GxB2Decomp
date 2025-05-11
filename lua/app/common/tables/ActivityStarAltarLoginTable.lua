-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarAltarLoginTable.lua

local ActivityStarAltarLoginTable = class("ActivityStarAltarLoginTable", import("app.common.tables.BaseTable"))

function ActivityStarAltarLoginTable:ctor()
	ActivityStarAltarLoginTable.super.ctor(self, "activity_star_altar_login")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarAltarLoginTable:getCost(id)
	self:split2Cost(id, "cost", "#")
end

function ActivityStarAltarLoginTable:getAward(id)
	print(id, "  id   ")

	return self:split2Cost(id, "awards", "|#")
end

function ActivityStarAltarLoginTable:getIDs()
	return self.ids_
end

return ActivityStarAltarLoginTable
