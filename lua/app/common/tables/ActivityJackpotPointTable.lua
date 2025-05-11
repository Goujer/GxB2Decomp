-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJackpotPointTable.lua

local ActivityJackpotPointTable = class("ActivityJackpotPointTable", import("app.common.tables.BaseTable"))

function ActivityJackpotPointTable:ctor()
	ActivityJackpotPointTable.super.ctor(self, "activity_jackpot_point")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityJackpotPointTable:getIDs()
	return self.ids_
end

function ActivityJackpotPointTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityJackpotPointTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityJackpotPointTable
