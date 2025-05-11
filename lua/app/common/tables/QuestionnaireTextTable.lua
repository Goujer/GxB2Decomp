-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/QuestionnaireTextTable.lua

local QuestionnaireTextTable = class("QuestionnaireTextTable", import("app.common.tables.BaseTable"))

function QuestionnaireTextTable:ctor()
	QuestionnaireTextTable.super.ctor(self, "questionnaire_text_" .. tostring(xyd.Global.lang))
end

function QuestionnaireTextTable:getText(id)
	return self:getString(id, "text")
end

return QuestionnaireTextTable
