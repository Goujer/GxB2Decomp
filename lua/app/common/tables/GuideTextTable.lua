-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuideTextTable.lua

local GuideTextTable = class("GuideTextTable", import("app.common.tables.BaseTable"))

function GuideTextTable:ctor()
	if xyd.isDogVersionOpen() then
		GuideTextTable.super.ctor(self, "guide_" .. tostring(xyd.Global.guideType) .. "_new_text_" .. tostring(xyd.Global.lang))
	else
		GuideTextTable.super.ctor(self, "guide_" .. tostring(xyd.Global.guideType) .. "_text_" .. tostring(xyd.Global.lang))
	end
end

function GuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function GuideTextTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function GuideTextTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function GuideTextTable:getMaskIconH5(id)
	return self:getString(id, "mask_icon_h5")
end

function GuideTextTable:getIconOffsetH5(id)
	return self:split2num(id, "icon_offset_h5", "|")
end

return GuideTextTable
