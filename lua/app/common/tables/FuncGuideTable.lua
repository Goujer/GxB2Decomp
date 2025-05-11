-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FuncGuideTable.lua

local FuncGuideTable = class("FuncGuideTable", import("app.common.tables.BaseTable"))

function FuncGuideTable:ctor()
	FuncGuideTable.super.ctor(self, "func_guide")

	self.levels_ = {}
	self.guideName_ = {}
end

function FuncGuideTable:getLevel(id)
	return self:getNumber(id, "level")
end

function FuncGuideTable:getAwardItem(id)
	return self:getNumber(id, "award_item") or 0
end

return FuncGuideTable
