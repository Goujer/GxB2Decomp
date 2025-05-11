-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEnconterStoryTable.lua

local ActivityEnconterStoryTable = class("ActivityBeachStarAwardTable", import("app.common.tables.BaseTable"))

function ActivityEnconterStoryTable:ctor()
	ActivityEnconterStoryTable.super.ctor(self, "activity_encounter_story")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEnconterStoryTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityEnconterStoryTable:getTextID(id)
	return self:getNumber(id, "text_id")
end

function ActivityEnconterStoryTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

return ActivityEnconterStoryTable
