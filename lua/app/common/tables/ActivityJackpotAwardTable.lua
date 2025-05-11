-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJackpotAwardTable.lua

local ActivityJackpotAwardTable = class("ActivityJackpotAwardTable", import("app.common.tables.BaseTable"))

function ActivityJackpotAwardTable:ctor()
	ActivityJackpotAwardTable.super.ctor(self, "activity_jackpot_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityJackpotAwardTable:getIDs()
	return self.ids_
end

function ActivityJackpotAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityJackpotAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityJackpotAwardTable
