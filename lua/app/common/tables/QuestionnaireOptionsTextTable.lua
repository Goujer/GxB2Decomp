-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/QuestionnaireOptionsTextTable.lua

local QuestionnaireOptionsTextTable = class("QuestionnaireOptionsTextTable", import("app.common.tables.BaseTable"))

function QuestionnaireOptionsTextTable:ctor()
	QuestionnaireOptionsTextTable.super.ctor(self, "questionnaire_options_text_" .. tostring(xyd.Global.lang))
end

function QuestionnaireOptionsTextTable:getText(id)
	return self:getString(id, "text")
end

return QuestionnaireOptionsTextTable
