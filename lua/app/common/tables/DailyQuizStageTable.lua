-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DailyQuizStageTable.lua

local DailyQuizStageTable = class("DailyQuizStageTable", import("app.common.tables.BaseTable"))

function DailyQuizStageTable:ctor()
	DailyQuizStageTable.super.ctor(self, "quiz_stage")
end

function DailyQuizStageTable:getPower(id)
	return self:getNumber(id, "power")
end

return DailyQuizStageTable
