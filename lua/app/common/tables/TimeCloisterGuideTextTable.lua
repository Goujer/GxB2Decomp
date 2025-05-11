-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterGuideTextTable.lua

local TimeCloisterGuideTextTable = class("TimeCloisterGuideTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterGuideTextTable:ctor()
	TimeCloisterGuideTextTable.super.ctor(self, "time_cloister_guide_text_" .. tostring(xyd.Global.lang))
end

function TimeCloisterGuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return TimeCloisterGuideTextTable
