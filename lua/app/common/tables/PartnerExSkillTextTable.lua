-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerExSkillTextTable.lua

PartnerExSkillTextTable = class("PartnerExSkillTextTable", import("app.common.tables.BaseTable"))

function PartnerExSkillTextTable:ctor()
	PartnerExSkillTextTable.super.ctor(self, "partner_exskill_text_" .. tostring(xyd.Global.lang))
end

function PartnerExSkillTextTable:getDesc(id, value)
	local string = self:getString(id, "ex_skill_desc")

	if value then
		for i = 1, #value do
			string = string.gsub(string, "{" .. i .. "}", value[i])
		end
	end

	return string
end

return PartnerExSkillTextTable
