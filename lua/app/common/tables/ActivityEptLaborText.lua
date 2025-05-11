-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEptLaborText.lua

local ActivityEptLaborText = class("ActivityEptLaborText", import(".BaseTable"))

function ActivityEptLaborText:ctor()
	ActivityEptLaborText.super.ctor(self, "activity_ept_labor_text_" .. tostring(xyd.Global.lang))
end

function ActivityEptLaborText:getStateName(id)
	return self:getString(id, "state")
end

function ActivityEptLaborText:getBrief(id)
	return self:getString(id, "brief")
end

function ActivityEptLaborText:getDetailText(id)
	return self:getString(id, "detail")
end

return ActivityEptLaborText
