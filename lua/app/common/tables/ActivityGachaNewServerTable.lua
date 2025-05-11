-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGachaNewServerTable.lua

local ActivityGachaNewServerTable = class("ActivityGachaNewServerTable", import("app.common.tables.BaseTable"))

function ActivityGachaNewServerTable:ctor()
	ActivityGachaNewServerTable.super.ctor(self, "activity_gacha_new_server")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityGachaNewServerTable:getIDs()
	return self.ids_
end

function ActivityGachaNewServerTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityGachaNewServerTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityGachaNewServerTable:getMaxPoint()
	local id = self.ids_[#self.ids_]

	return self:getPoint(id)
end

return ActivityGachaNewServerTable
