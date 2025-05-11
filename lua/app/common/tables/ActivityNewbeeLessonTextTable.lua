-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewbeeLessonTextTable.lua

local ActivityNewbeeLessonTextTable = class("ActivityNewbeeLessonTextTable", import(".BaseTable"))

function ActivityNewbeeLessonTextTable:ctor()
	ActivityNewbeeLessonTextTable.super.ctor(self, "activity_newbee_lesson_text_" .. xyd.Global.lang)
end

function ActivityNewbeeLessonTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityNewbeeLessonTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityNewbeeLessonTextTable
