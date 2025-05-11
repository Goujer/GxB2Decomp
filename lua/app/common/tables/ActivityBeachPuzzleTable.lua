-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachPuzzleTable.lua

local ActivityBeachPuzzleTable = class("ActivityBeachPuzzleTable", import("app.common.tables.BaseTable"))

function ActivityBeachPuzzleTable:ctor()
	ActivityBeachPuzzleTable.super.ctor(self, "activity_beach_puzzle")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityBeachPuzzleTable:getIDs()
	return self.ids_
end

function ActivityBeachPuzzleTable:getPartNum(id)
	return self:getNumber(id, "num")
end

function ActivityBeachPuzzleTable:getAwards(id)
	return self:split2Cost(id, "area_award", "|#")
end

function ActivityBeachPuzzleTable:getArea(id)
	return self:split2Cost(id, "area", "|#")
end

function ActivityBeachPuzzleTable:getFinalAward(id)
	return self:split2Cost(id, "final_award", "#")
end

function ActivityBeachPuzzleTable:getIsRepeat(id)
	return self:getNumber(id, "is_repeat")
end

function ActivityBeachPuzzleTable:getLinePos(id)
	return self:split2Cost(id, "area_line", "|#")
end

function ActivityBeachPuzzleTable:getBgName(id)
	return self:getString(id, "bg")
end

return ActivityBeachPuzzleTable
