-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStudyQuestionTable.lua

local ActivityStudyQuestionTable = class("ActivityStudyQuestionTable", import("app.common.tables.BaseTable"))

function ActivityStudyQuestionTable:ctor()
	ActivityStudyQuestionTable.super.ctor(self, "activity_study_quest")

	self.ids = {}
	self.questionIDtoId_ = {}

	for id, v in pairs(self.TableLua.rows) do
		local que_id = self:getQueID(id)

		self.questionIDtoId_[que_id] = id

		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityStudyQuestionTable:getQueID(id)
	return self:getNumber(id, "quest_id")
end

function ActivityStudyQuestionTable:getIDbyQue(queID)
	return self.questionIDtoId_[queID]
end

function ActivityStudyQuestionTable:getAnswer(id)
	return self:getNumber(id, "answer")
end

function ActivityStudyQuestionTable:getNeedLev(id)
	return self:getNumber(id, "need_level")
end

function ActivityStudyQuestionTable:getInUse(id)
	return self:getNumber(id, "in_use")
end

function ActivityStudyQuestionTable:getQueText(id)
	local que_id = self:getQueID(id)

	return xyd.tables.activityStudyQuestionTextTable:getText(que_id)
end

function ActivityStudyQuestionTable:getQueOptionText(id, index)
	local que_id = self:getQueID(id)

	return xyd.tables.activityStudyQuestionTextTable:getOptionText(que_id, index)
end

function ActivityStudyQuestionTable:getJumpWindow(id)
	return self:split2num(id, "get_way", "#")
end

return ActivityStudyQuestionTable
