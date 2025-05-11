-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AcademyAssessmentTextTable.lua

local BaseTable = import(".BaseTable")
local AcademyAssessmentTextTable = class("AcademyAssessmentTextTable", BaseTable)

function AcademyAssessmentTextTable:ctor()
	AcademyAssessmentTextTable.super.ctor(self, "academy_assessment_text_" .. tostring(xyd.Global.lang))
end

function AcademyAssessmentTextTable:fortName(fortId)
	return self:getString(fortId, "fort_name")
end

function AcademyAssessmentTextTable:description(fortId)
	return self:getString(fortId, "description")
end

function AcademyAssessmentTextTable:getDesc(fortId)
	return self:getString(fortId, "desc")
end

return AcademyAssessmentTextTable
