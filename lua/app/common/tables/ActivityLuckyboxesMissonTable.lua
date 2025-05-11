-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLuckyboxesMissonTable.lua

local ActivityLuckyboxesMissonTable = class("ActivityLuckyboxesMissonTable", import("app.common.tables.BaseTable"))

function ActivityLuckyboxesMissonTable:ctor()
	ActivityLuckyboxesMissonTable.super.ctor(self, "activity_luckyboxes_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLuckyboxesMissonTable:getIDs()
	return self.ids_
end

function ActivityLuckyboxesMissonTable:getWay(id)
	return self:getNumber(id, "go_window")
end

function ActivityLuckyboxesMissonTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityLuckyboxesMissonTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityLuckyboxesMissonTable
