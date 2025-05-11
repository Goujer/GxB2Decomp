-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachMatchupTable.lua

local ActivityBeachMatchupTable = class("ActivityBeachMatchupTable", import("app.common.tables.BaseTable"))

function ActivityBeachMatchupTable:ctor()
	ActivityBeachMatchupTable.super.ctor(self, "activity_beach_matchup")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityBeachMatchupTable:getIDs()
	return self.ids
end

function ActivityBeachMatchupTable:getMatchup(id)
	return self:split2num(id, "matchup", ";")
end

return ActivityBeachMatchupTable
