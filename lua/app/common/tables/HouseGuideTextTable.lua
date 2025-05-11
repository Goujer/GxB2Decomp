-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseGuideTextTable.lua

local HouseGuideTextTable = class("HouseGuideTextTable", import("app.common.tables.BaseTable"))

function HouseGuideTextTable:ctor()
	HouseGuideTextTable.super.ctor(self, "house_guide_text_" .. tostring(xyd.Global.lang))
end

function HouseGuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return HouseGuideTextTable
