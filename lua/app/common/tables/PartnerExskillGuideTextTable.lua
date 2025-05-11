-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerExskillGuideTextTable.lua

local PartnerExskillGuideTextTable = class("PartnerExskillGuideTextTable", import("app.common.tables.BaseTable"))

function PartnerExskillGuideTextTable:ctor()
	PartnerExskillGuideTextTable.super.ctor(self, "partner_exskill_guide_text_" .. tostring(xyd.Global.lang))
end

function PartnerExskillGuideTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return PartnerExskillGuideTextTable
