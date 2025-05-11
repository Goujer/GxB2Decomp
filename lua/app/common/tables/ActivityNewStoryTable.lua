-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewStoryTable.lua

local ActivityNewStoryTable = class("ActivityNewStoryTable", import("app.common.tables.BaseTable"))

function ActivityNewStoryTable:ctor()
	ActivityNewStoryTable.super.ctor(self, "activity_new_story")

	self.ids_ = {}
	self.idsByFortId_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local fortId = self:getFortId(id)

		if not self.idsByFortId_[fortId] then
			self.idsByFortId_[fortId] = {}
		end

		table.insert(self.idsByFortId_[fortId], id)
	end
end

function ActivityNewStoryTable:getNext(id)
	return self:getNumber(id, "next")
end

function ActivityNewStoryTable:getFortFinal(id)
	return self:getNumber(id, "fort_final")
end

function ActivityNewStoryTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityNewStoryTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityNewStoryTable:getInitialPartner(id)
	return self:split2num(id, "initial_partner", "|")
end

function ActivityNewStoryTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function ActivityNewStoryTable:getPlotIds(id)
	return self:split2num(id, "plot_id", "#")
end

function ActivityNewStoryTable:getFortId(id)
	return self:getNumber(id, "fort_id")
end

function ActivityNewStoryTable:getIdsByFort(fort_id)
	return self.idsByFortId_[fort_id]
end

function ActivityNewStoryTable:getName(id)
	return self:getNumber(id, "name")
end

function ActivityNewStoryTable:getAward(id)
	return self:split2num(id, "award", "#")
end

function ActivityNewStoryTable:getUnlockTime(id)
	return self:getNumber(id, "unlock_time")
end

function ActivityNewStoryTable:getActivityPlotListId(id)
	return self:getNumber(id, "activity_plot_list_id")
end

return ActivityNewStoryTable
