-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLotteryTable.lua

local ActivityLotteryTable = class("ActivityLotteryTable", import("app.common.tables.BaseTable"))

function ActivityLotteryTable:ctor()
	ActivityLotteryTable.super.ctor(self, "activity_lottery")

	self.ids = {}
	self.pos2Id = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		local pos = self:getPos(id)

		self.pos2Id[pos] = tonumber(id)
	end

	table.sort(self.ids)
end

function ActivityLotteryTable:getIDs()
	return self.ids
end

function ActivityLotteryTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityLotteryTable:getType2(id)
	return self:getNumber(id, "type2")
end

function ActivityLotteryTable:getIdByPos(pos)
	return self.pos2Id[pos]
end

function ActivityLotteryTable:getPos(id)
	return self:getNumber(id, "show_id")
end

return ActivityLotteryTable
