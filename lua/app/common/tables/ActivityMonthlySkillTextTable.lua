-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthlySkillTextTable.lua

local ActivityMonthlySkillTextTable = class("ActivityMonthlySkillTextTable", import("app.common.tables.BaseTable"))

function ActivityMonthlySkillTextTable:ctor()
	ActivityMonthlySkillTextTable.super.ctor(self, "activity_monthly_skill_text_" .. tostring(xyd.Global.lang))
end

function ActivityMonthlySkillTextTable:getName(id)
	return self:getString(id, "skill_name")
end

function ActivityMonthlySkillTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityMonthlySkillTextTable
