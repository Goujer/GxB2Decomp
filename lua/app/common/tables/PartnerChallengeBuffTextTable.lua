-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeBuffTextTable.lua

local PartnerChallengeBuffTextTable = class("PartnerChallengeBuffTextTable", import("app.common.tables.BaseTable"))

function PartnerChallengeBuffTextTable:ctor()
	PartnerChallengeBuffTextTable.super.ctor(self, "partner_challenge_buff_text_" .. tostring(xyd.Global.lang))
end

function PartnerChallengeBuffTextTable:getName(id)
	return self:getString(id, "name")
end

function PartnerChallengeBuffTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return PartnerChallengeBuffTextTable
