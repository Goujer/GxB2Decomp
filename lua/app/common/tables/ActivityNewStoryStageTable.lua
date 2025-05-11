-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewStoryStageTable.lua

local ActivityNewStoryStageTable = class("ActivityNewStoryStageTable", import("app.common.tables.BaseTable"))

function ActivityNewStoryStageTable:ctor()
	ActivityNewStoryStageTable.super.ctor(self, "activity_new_story_stage")

	self.ids_ = {}
	self.idsByFortId_ = {}
	self.idsByStageBelong_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local belong = self:getStageBelong(id)
		local fort_id = xyd.tables.activityNewStoryTable:getFortId(belong)

		if not self.idsByFortId_[fort_id] then
			self.idsByFortId_[fort_id] = {}
		end

		table.insert(self.idsByFortId_[fort_id], id)

		if not self.idsByStageBelong_[belong] then
			self.idsByStageBelong_[belong] = {}
		end

		table.insert(self.idsByStageBelong_[belong], id)
	end
end

function ActivityNewStoryStageTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityNewStoryStageTable:getStageBelong(id)
	return self:getNumber(id, "stage_belong")
end

function ActivityNewStoryStageTable:getOffsetX(id)
	return self:getNumber(id, "offsetX")
end

function ActivityNewStoryStageTable:getOffsetY(id)
	return self:getNumber(id, "offsetY")
end

function ActivityNewStoryStageTable:getIdsByBelongId(belong_id)
	return self.idsByStageBelong_[belong_id + 1]
end

function ActivityNewStoryStageTable:getIdsByFortId(fort_id)
	return self.idsByFortId_[fort_id + 1]
end

return ActivityNewStoryStageTable
