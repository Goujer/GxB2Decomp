-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StoryTable.lua

local StoryTable = class("StoryTable", import("app.common.tables.BasePlotTable"))

function StoryTable:ctor()
	StoryTable.super.ctor(self, "activity_plot")
end

function StoryTable:getResPath(id)
	return self:getString(id, "res_path")
end

function StoryTable:getScale(id)
	return self:getNumber(id, "scale")
end

function StoryTable:getPartnerPicXYDelta(id)
	return self:split2Cost(id, "partner_picture_xy", "|")
end

function StoryTable:getImagePath(id)
	return self:getString(id, "image_path")
end

function StoryTable:getType(id)
	return self:getNumber(id, "type")
end

function StoryTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function StoryTable:getShowType(id)
	return self:getNumber(id, "show_type")
end

function StoryTable:getDisappearType(id)
	return self:getNumber(id, "disappear_type")
end

function StoryTable:getPositionMove(id)
	return self:split2Cost(id, "position_move", "|")
end

function StoryTable:getShowTime(id)
	return self:getNumber(id, "show_time")
end

function StoryTable:getDisappearTime(id)
	return self:getNumber(id, "disappear_time")
end

function StoryTable:getSwapOverlap(id)
	return self:getNumber(id, "swap_overlap")
end

function StoryTable:getMapSwap(id)
	return self:getNumber(id, "map_swap")
end

function StoryTable:getName(id)
	return xyd.tables.storyTextTable:getName(id)
end

function StoryTable:getDialog(id)
	return xyd.tables.storyTextTable:getDialog(id)
end

function StoryTable:getSelects(id)
	return xyd.tables.storyTextTable:getSelects(id)
end

function StoryTable:getSpinePath(id)
	return self:getNumber(id, "spine_path")
end

function StoryTable:effect(id)
	return {}
end

return StoryTable
