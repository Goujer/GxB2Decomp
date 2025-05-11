-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/QuestionnaireOptionsTable.lua

local QuestionnaireOptionsTable = class("QuestionnaireOptionsTable", import("app.common.tables.BaseTable"))

function QuestionnaireOptionsTable:ctor()
	QuestionnaireOptionsTable.super.ctor(self, "questionnaire_options")
end

function QuestionnaireOptionsTable:getIsFillable(id)
	return self:getNumber(id, "is_fillable")
end

function QuestionnaireOptionsTable:getLangHide(id)
	return xyd.split(self:getString(id, "lang_hide"), "|", false)
end

return QuestionnaireOptionsTable
