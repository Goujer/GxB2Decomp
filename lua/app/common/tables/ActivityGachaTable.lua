-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGachaTable.lua

local ActivityGachaTable = class("ActivityGachaTable", import("app.common.tables.BaseTable"))

function ActivityGachaTable:ctor()
	ActivityGachaTable.super.ctor(self, "activity_gacha")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityGachaTable:getIDs()
	return self.ids_
end

function ActivityGachaTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityGachaTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityGachaTable:getMaxPoint()
	local id = self.ids_[#self.ids_]

	return self:getPoint(id)
end

return ActivityGachaTable
