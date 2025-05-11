-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DailyQuizTable.lua

local DailyQuizTable = class("DailyQuizTable", import("app.common.tables.BaseTable"))

function DailyQuizTable:ctor()
	DailyQuizTable.super.ctor(self, "quiz")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local type = row[colIndexTable.type]

		if self.ids_[type + 1] == nil then
			self.ids_[type + 1] = {}
		end

		self.ids_[type + 1] = self.ids_[type + 1] or {}

		table.insert(self.ids_[type + 1], tonumber(id))
	end

	for key, _ in pairs(self.ids_) do
		table.sort(self.ids_[key])
	end
end

function DailyQuizTable:getPower(id)
	return self:getNumber(id, "power")
end

function DailyQuizTable:getIDsByType(quizType)
	return self.ids_[quizType + 1] or {}
end

function DailyQuizTable:getShowAward(id)
	return xyd.split(self:getString(id, "show_award"), "|")
end

function DailyQuizTable:getLv(id)
	return self:getNumber(id, "lv")
end

function DailyQuizTable:getDifficulty(id)
	return self:getNumber(id, "difficulty")
end

function DailyQuizTable:getType(id)
	return self:getNumber(id, "type")
end

return DailyQuizTable
