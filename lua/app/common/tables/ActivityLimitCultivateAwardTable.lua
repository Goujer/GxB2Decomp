-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitCultivateAwardTable.lua

local ActivityLimitCultivateAwardTable = class("ActivityLimitCultivateAwardTable", import("app.common.tables.BaseTable"))

function ActivityLimitCultivateAwardTable:ctor()
	ActivityLimitCultivateAwardTable.super.ctor(self, "activity_5week_awards")

	self.ids_ = {}
	self.maxPoint_ = 0

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local point = self:getPoint(id)

		if point > self.maxPoint_ then
			self.maxPoint_ = point
		end
	end

	table.sort(self.ids_)
end

function ActivityLimitCultivateAwardTable:getPoint(id)
	return self:getNumber(id, "num")
end

function ActivityLimitCultivateAwardTable:getMaxPoint()
	return self.maxPoint_
end

function ActivityLimitCultivateAwardTable:getAward(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityLimitCultivateAwardTable:getIDs()
	return self.ids_
end

return ActivityLimitCultivateAwardTable
