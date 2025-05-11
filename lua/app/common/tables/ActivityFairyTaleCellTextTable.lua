-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleCellTextTable.lua

local ActivityFairyTaleCellTextTable = class("ActivityFairyTaleCellTextTable", import(".BaseTable"))

function ActivityFairyTaleCellTextTable:ctor()
	ActivityFairyTaleCellTextTable.super.ctor(self, "activity_fairytale_cell_text_" .. tostring(xyd.Global.lang))
end

function ActivityFairyTaleCellTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityFairyTaleCellTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function ActivityFairyTaleCellTextTable:getNum(id)
	return self:getString(id, "num")
end

return ActivityFairyTaleCellTextTable
