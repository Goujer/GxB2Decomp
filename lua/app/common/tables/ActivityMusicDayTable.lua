-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMusicDayTable.lua

local ActivityMusicDayTable = class("ActivityMusicDayTable", import("app.common.tables.BaseTable"))

function ActivityMusicDayTable:ctor()
	ActivityMusicDayTable.super.ctor(self, "activity_music_day")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityMusicDayTable:getIds()
	return self.ids_
end

function ActivityMusicDayTable:getUnlockingTime(id)
	return self:getNumber(id, "unlocking_time")
end

function ActivityMusicDayTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityMusicDayTable:getCompleteValue(id)
	return self:split2num(id, "complete_value", "|")
end

return ActivityMusicDayTable
