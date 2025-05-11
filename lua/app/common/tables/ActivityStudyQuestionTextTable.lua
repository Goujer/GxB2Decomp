-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStudyQuestionTextTable.lua

local ActivityStudyQuestionTextTable = class("ActivityStudyQuestionTextTable", import("app.common.tables.BaseTable"))

function ActivityStudyQuestionTextTable:ctor()
	ActivityStudyQuestionTextTable.super.ctor(self, "activity_study_quest_text_" .. tostring(xyd.Global.lang))

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityStudyQuestionTextTable:getText(id)
	return self:getString(id, "text")
end

function ActivityStudyQuestionTextTable:getOptionText(id, index)
	return self:getString(id, "option" .. index)
end

return ActivityStudyQuestionTextTable
