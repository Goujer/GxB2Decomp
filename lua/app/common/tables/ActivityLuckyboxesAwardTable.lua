-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLuckyboxesAwardTable.lua

local ActivityLuckyboxesAwardTable = class("ActivityLuckyboxesAwardTable", import("app.common.tables.BaseTable"))

function ActivityLuckyboxesAwardTable:ctor()
	ActivityLuckyboxesAwardTable.super.ctor(self, "activity_luckyboxes_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLuckyboxesAwardTable:getIDs()
	return self.ids_
end

function ActivityLuckyboxesAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityLuckyboxesAwardTable
