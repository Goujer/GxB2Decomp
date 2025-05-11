-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthlyHikeSkillTextTable.lua

local ActivityMonthlyHikeSkillTextTable = class("ActivityMonthlyHikeSkillTextTable", import("app.common.tables.BaseTable"))

function ActivityMonthlyHikeSkillTextTable:ctor()
	ActivityMonthlyHikeSkillTextTable.super.ctor(self, "activity_monthly_skill_text_" .. tostring(xyd.Global.lang))
end

function ActivityMonthlyHikeSkillTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityMonthlyHikeSkillTextTable
