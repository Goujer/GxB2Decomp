-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLostSpaceBoxesTable.lua

local ActivityLostSpaceBoxesTable = class("ActivityLostSpaceBoxesTable", import("app.common.tables.BaseTable"))

function ActivityLostSpaceBoxesTable:ctor()
	ActivityLostSpaceBoxesTable.super.ctor(self, "activity_lost_space_boxes")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLostSpaceBoxesTable:getIDs()
	return self.ids_
end

function ActivityLostSpaceBoxesTable:getAward(id)
	return self:split2Cost(id, "award", "#", true)
end

function ActivityLostSpaceBoxesTable:getBoxes(id)
	return self:getNumber(id, "boxes")
end

function ActivityLostSpaceBoxesTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityLostSpaceBoxesTable:getShowIcon(id)
	return self:getNumber(id, "show_icon")
end

return ActivityLostSpaceBoxesTable
