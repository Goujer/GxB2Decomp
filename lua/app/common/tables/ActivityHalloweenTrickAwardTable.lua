-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHalloweenTrickAwardTable.lua

local ActivityHalloweenTrickAwardTable = class("ActivityHalloweenTrickAwardTable", import("app.common.tables.BaseTable"))

function ActivityHalloweenTrickAwardTable:ctor()
	ActivityHalloweenTrickAwardTable.super.ctor(self, "activity_trickortreat_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityHalloweenTrickAwardTable:getIDs()
	return self.ids_
end

function ActivityHalloweenTrickAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityHalloweenTrickAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityHalloweenTrickAwardTable
