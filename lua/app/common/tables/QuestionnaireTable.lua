-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/QuestionnaireTable.lua

local QuestionnaireTable = class("QuestionnaireTable", import("app.common.tables.BaseTable"))

function QuestionnaireTable:ctor()
	QuestionnaireTable.super.ctor(self, "questionnaire")

	self.total_ = {}
	self.first_ = {}
	self.questionnaireWithType = {}

	for id, _ in pairs(self.TableLua.rows) do
		local type = self:getType(id)
		local q_type = self:getQuestionType(id)

		if q_type ~= 4 then
			if self.total_[type] == nil then
				self.total_[type] = 0
			end

			local tmp = self.total_[type]

			self.total_[type] = tmp + 1
		end

		if not self.questionnaireWithType[type] then
			self.questionnaireWithType[type] = 1
		end
	end
end

function QuestionnaireTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function QuestionnaireTable:getOptions(id)
	local options = self:split2num(id, "options", "|")
	local final_options = {}

	for i = 1, #options do
		local op = options[i]
		local hide_lang = xyd.tables.questionnaireOptionsTable:getLangHide(op)
		local flag = true

		if hide_lang then
			for i = 1, #hide_lang do
				local lang = hide_lang[i]

				if lang == xyd.Global.lang then
					flag = false

					break
				end
			end
		end

		if flag then
			table.insert(final_options, op)
		end
	end

	return final_options
end

function QuestionnaireTable:getChoices(id)
	return self:getNumber(id, "choices")
end

function QuestionnaireTable:getTotal(type)
	return self.total_[type]
end

function QuestionnaireTable:getSubQuestion(id)
	return self:split2num(id, "sub_question", "|")
end

function QuestionnaireTable:getIsOptional(id)
	return self:getNumber(id, "is_optional")
end

function QuestionnaireTable:getQuestionType(id)
	return self:getNumber(id, "question_type")
end

function QuestionnaireTable:getType(id)
	return self:getNumber(id, "type")
end

function QuestionnaireTable:isFirst(id)
	return self:getNumber(id, "is_first")
end

function QuestionnaireTable:getFirstId()
	return self.first_
end

function QuestionnaireTable:getThisNumber(id)
	return self:getNumber(id, "this_number")
end

function QuestionnaireTable:getCheckType(id)
	return self:getNumber(id, "check_type")
end

function QuestionnaireTable:getCheckID(id)
	return self:getNumber(id, "check_id")
end

function QuestionnaireTable:getIsHaveQuestionnaireWithType(type)
	if self.questionnaireWithType[type] and self.questionnaireWithType[type] == 1 then
		return true
	end

	return false
end

return QuestionnaireTable
