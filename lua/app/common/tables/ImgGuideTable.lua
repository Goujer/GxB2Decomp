-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ImgGuideTable.lua

local ImgGuideTable = class("ImgGuideTable", import("app.common.tables.BaseTable"))

function ImgGuideTable:ctor()
	ImgGuideTable.super.ctor(self, "img_guide")
end

function ImgGuideTable:getPreName(name)
	return self:getString(name, "prename")
end

function ImgGuideTable:getGuideNumber(name)
	return self:split(name, "guide_number", "|")
end

function ImgGuideTable:getGuideSize(name)
	return self:split(name, "guide_size", "|")
end

function ImgGuideTable:getHideMask(name)
	return self:getNumber(name, "hide_mask")
end

function ImgGuideTable:getSkinName(name)
	return self:getString(name, "skin_name")
end

function ImgGuideTable:getLabelNum(name)
	return self:split(name, "label_number", "|")
end

function ImgGuideTable:getLabelName(name)
	return self:getString(name, "label_name")
end

function ImgGuideTable:getIconNum(name)
	return self:split(name, "icon_number", "|")
end

return ImgGuideTable
