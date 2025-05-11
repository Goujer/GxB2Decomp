-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCourseLearningTable.lua

local ActivityCourseLearningTable = class("ActivityCourseLearningTable", import("app.common.tables.BaseTable"))

function ActivityCourseLearningTable:ctor()
	local tableName = "activity_course_learning"

	if not xyd.models.activity:getActivity(xyd.ActivityID.COURSE_RESEARCH) then
		tableName = "activity_course_learning_2"
	end

	ActivityCourseLearningTable.super.ctor(self, tableName)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityCourseLearningTable:getIds()
	return self.ids_
end

function ActivityCourseLearningTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityCourseLearningTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivityCourseLearningTable:getLastLevel()
	return tonumber(self.ids_[#self.ids_])
end

return ActivityCourseLearningTable
