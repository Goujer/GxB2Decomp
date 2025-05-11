-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AcademyAssessmentGuideTextTable.lua

local BaseTable = import(".BaseTable")
local AcademyAssessmentGuideTextTable = class("AcademyAssessmentGuideTextTable", BaseTable)

function AcademyAssessmentGuideTextTable:ctor()
	BaseTable.ctor(self, "school_practise_guide_text_" .. tostring(xyd.Global.lang))
end

function AcademyAssessmentGuideTextTable:getDesc(id)
	id = tostring(id)

	return self:getString(id, "desc")
end

return AcademyAssessmentGuideTextTable
