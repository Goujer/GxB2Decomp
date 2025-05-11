-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BasePlotTable.lua

local BasePlotTable = class("BasePlotTable", import("app.common.tables.BaseTable"))

function BasePlotTable:ctor(tableName)
	BasePlotTable.super.ctor(self, tableName)
end

function BasePlotTable:getPlot(id)
	return self:getString(id, "plot")
end

function BasePlotTable:getResPath(id)
	return self:getString(id, "res_path")
end

function BasePlotTable:getScale(id)
	return self:getNumber(id, "scale")
end

function BasePlotTable:getPartnerPicXYDelta(id)
	return self:split2Cost(id, "partner_picture_xy", "|")
end

function BasePlotTable:getImagePath(id)
	return self:getString(id, "image_path")
end

function BasePlotTable:getType(id)
	return self:getNumber(id, "type")
end

function BasePlotTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function BasePlotTable:getShowType(id)
	return self:getNumber(id, "show_type")
end

function BasePlotTable:getDisappearType(id)
	return self:getNumber(id, "disappear_type")
end

function BasePlotTable:getPositionMove(id)
	return self:split2Cost(id, "position_move", "|")
end

function BasePlotTable:getShowTime(id)
	return self:getNumber(id, "show_time")
end

function BasePlotTable:getDisappearTime(id)
	return self:getNumber(id, "disappear_time")
end

function BasePlotTable:getSwapOverlap(id)
	return self:getNumber(id, "swap_overlap")
end

function BasePlotTable:getMapSwap(id)
	return self:getNumber(id, "map_swap")
end

function BasePlotTable:getFlipX(id)
	return self:getNumber(id, "image_mirror") == 1 and -1 or 1
end

function BasePlotTable:isSelect(id)
	return self:getNumber(id, "select") == 1
end

function BasePlotTable:getSelectNextIDs(id)
	return self:split2num(id, "select_next_ids", "|")
end

function BasePlotTable:isCgShow(id)
	return self:getNumber(id, "cg_show") == 1
end

function BasePlotTable:getCgPath(id)
	return self:split(id, "cg_path", "#")
end

function BasePlotTable:getCgShowType(id)
	return self:split2num(id, "cg_show_type", "#")
end

function BasePlotTable:getCGScale(id)
	return self:split2num(id, "cg_scale", "#")
end

function BasePlotTable:getCgShowTime(id)
	return self:split2num(id, "cg_show_time", "#")
end

function BasePlotTable:getCgDisappearType(id)
	return self:split2num(id, "cg_disappear_type", "#")
end

function BasePlotTable:getCgDisappearTime(id)
	return self:split2num(id, "cg_disappear_time", "#")
end

function BasePlotTable:getCgStartXY(id)
	local sp = self:split(id, "cg_start_xy", "#")
	local cost = {}

	for i = 1, #sp do
		table.insert(cost, xyd.split(sp[i], "|", true))
	end

	return cost
end

function BasePlotTable:getCgShowXY(id)
	local sp = self:split(id, "cg_show_xy", "#")
	local cost = {}

	for i = 1, #sp do
		table.insert(cost, xyd.split(sp[i], "|", true))
	end

	return cost
end

function BasePlotTable:getCgDisappearXY(id)
	local sp = self:split(id, "cg_disappear_xy", "#")
	local cost = {}

	for i = 1, #sp do
		table.insert(cost, xyd.split(sp[i], "|", true))
	end

	return cost
end

function BasePlotTable:music(id)
	return self:getNumber(id, "music") or 7001
end

function BasePlotTable:getSound(id)
	if xyd.Global.lang == "ja_jp" then
		return 0
	end

	return self:getNumber(id, "sound")
end

function BasePlotTable:expression(id)
	return self:getNumber(id, "expression")
end

function BasePlotTable:isBubbleMirror(id)
	return self:getNumber(id, "bubble_mirror") == 1
end

function BasePlotTable:bubblePos(id)
	return self:split2num(id, "bubble_xy", "|")
end

function BasePlotTable:bubbleExpression(id)
	return self:getNumber(id, "bubble_expression")
end

function BasePlotTable:effect(id)
	return self:split(id, "effect", "|")
end

function BasePlotTable:effectPos(id)
	return self:split(id, "effect_xy", "|")
end

function BasePlotTable:jitter(id)
	return self:getNumber(id, "jitter")
end

function BasePlotTable:getEffectCount(id)
	return self:split(id, "effect_count", "|")
end

function BasePlotTable:getEffectLayer(id)
	return self:split(id, "effect_layer", "|")
end

function BasePlotTable:getEffectScale(id)
	return self:split(id, "effect_scale", "|")
end

function BasePlotTable:getFace(id)
	return self:getString(id, "face")
end

function BasePlotTable:getFacePos(id)
	local pos = xyd.split(self:getString(id, "face_pos"), "|", true)

	return {
		x = pos[1] or 0,
		y = pos[2] or 0
	}
end

function BasePlotTable:isMemory(id)
	return self:getNumber(id, "is_memory")
end

function BasePlotTable:getCGLayer(id)
	return self:split2num(id, "cg_layer", "#")
end

function BasePlotTable:getNoClickTime(id)
	return self:getNumber(id, "no_click_time")
end

function BasePlotTable:getFaceScale(id)
	local scale = self:getNumber(id, "face_scale")

	return xyd.checkCondition(scale == 0, 1, scale)
end

function BasePlotTable:getPicture(id)
	return self:getString(id, "picture")
end

function BasePlotTable:getPictureXY(id)
	return self:split2num(id, "picture_xy", "|")
end

function BasePlotTable:getPictureScale(id)
	return self:split2num(id, "picture_scale", "|")
end

function BasePlotTable:getName(id)
	return ""
end

function BasePlotTable:getDialog(id)
	return ""
end

function BasePlotTable:getSelects(id)
	return {}
end

function BasePlotTable:getEffectSound(id)
	return self:getNumber(id, "effect_sound")
end

function BasePlotTable:getAmbientSound(id)
	return self:split2num(id, "ambient_sound", "|")
end

return BasePlotTable
