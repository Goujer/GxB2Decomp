-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCrystalBallTable.lua

local ActivityCrystalBallTable = class("ActivityCrystalBallTable", import("app.common.tables.BaseTable"))
local crystalBallTextTable = xyd.tables.activityCrystalBallTextTable

function ActivityCrystalBallTable:ctor()
	ActivityCrystalBallTable.super.ctor(self, "activity_crystal_ball")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityCrystalBallTable:getDay(id)
	return self:getNumber(id, "day")
end

function ActivityCrystalBallTable:getImgName(id)
	return self:getString(id, "image_png")
end

function ActivityCrystalBallTable:getQuestionText(id)
	return crystalBallTextTable:getText(self:getNumber(id, "question_text_id"))
end

function ActivityCrystalBallTable:getWrongText(id)
	return crystalBallTextTable:getText(self:getNumber(id, "false_text_id"))
end

function ActivityCrystalBallTable:getTrueText(id)
	return crystalBallTextTable:getText(self:getNumber(id, "true_text_id"))
end

function ActivityCrystalBallTable:getSelectList(id)
	return self:split2Cost(id, "select_text_id", "|")
end

function ActivityCrystalBallTable:getTrueIndex(id)
	return self:getNumber(id, "true_id")
end

function ActivityCrystalBallTable:getRightShowImg(id)
	return self:getNumber(id, "partner_picture_id")
end

function ActivityCrystalBallTable:getUnlockPlot(id)
	return self:getNumber(id, "unlock_plot_id")
end

function ActivityCrystalBallTable:getFinishPlot(id)
	return self:split2num(id, "finish_plot_id", "|")
end

function ActivityCrystalBallTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityCrystalBallTable:getMoveDelta(id)
	return self:split2Cost(id, "move", "|")
end

function ActivityCrystalBallTable:getIds()
	return self.ids_
end

return ActivityCrystalBallTable
