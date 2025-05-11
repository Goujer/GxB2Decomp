-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStudyScoreTextTable.lua

local ActivityStudyScoreTextTable = class("ActivityStudyScoreTextTable", import("app.common.tables.BaseTable"))

function ActivityStudyScoreTextTable:ctor()
	ActivityStudyScoreTextTable.super.ctor(self, "activity_study_score_text_" .. xyd.Global.lang)

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityStudyScoreTextTable:getRightText(id)
	return self:getString(id, "react_right")
end

function ActivityStudyScoreTextTable:getWrongText(id)
	return self:getString(id, "react_wrong")
end

return ActivityStudyScoreTextTable
