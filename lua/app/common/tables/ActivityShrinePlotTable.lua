-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityShrinePlotTable.lua

local ActivityShrinePlotTable = class("ActivityShrinePlotTable", import("app.common.tables.BasePlotTable"))

function ActivityShrinePlotTable:ctor()
	ActivityShrinePlotTable.super.ctor(self, "shrine_plot")
end

function ActivityShrinePlotTable:getResPath(id)
	return self:getString(id, "res_path")
end

function ActivityShrinePlotTable:getScale(id)
	return self:getNumber(id, "scale")
end

function ActivityShrinePlotTable:getPartnerPicXYDelta(id)
	return self:split2Cost(id, "partner_picture_xy", "|")
end

function ActivityShrinePlotTable:getImagePath(id)
	return self:getString(id, "image_path")
end

function ActivityShrinePlotTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityShrinePlotTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function ActivityShrinePlotTable:getShowType(id)
	return self:getNumber(id, "show_type")
end

function ActivityShrinePlotTable:getDisappearType(id)
	return self:getNumber(id, "disappear_type")
end

function ActivityShrinePlotTable:getPositionMove(id)
	return self:split2Cost(id, "position_move", "|")
end

function ActivityShrinePlotTable:getShowTime(id)
	return self:getNumber(id, "show_time")
end

function ActivityShrinePlotTable:getDisappearTime(id)
	return self:getNumber(id, "disappear_time")
end

function ActivityShrinePlotTable:getSwapOverlap(id)
	return self:getNumber(id, "swap_overlap")
end

function ActivityShrinePlotTable:getMapSwap(id)
	return self:getNumber(id, "map_swap")
end

function ActivityShrinePlotTable:getName(id)
	return xyd.tables.activityShrinePlotTextTable:getName(id)
end

function ActivityShrinePlotTable:getDialog(id)
	return xyd.tables.activityShrinePlotTextTable:getDialog(id)
end

function ActivityShrinePlotTable:getSelects(id)
	return xyd.tables.activityShrinePlotTextTable:getSelects(id)
end

function ActivityShrinePlotTable:getSpinePath(id)
	return self:getNumber(id, "spine_path")
end

function ActivityShrinePlotTable:effect(id)
	return {}
end

return ActivityShrinePlotTable
