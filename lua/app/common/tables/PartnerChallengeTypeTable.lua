-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeTypeTable.lua

local BaseTable = import(".BaseTable")
local PartnerChallengeTypeTable = class("PartnerChallengeTypeTable", BaseTable)

function PartnerChallengeTypeTable:ctor()
	PartnerChallengeTypeTable.super.ctor(self, "partner_challenge_type_text_" .. string.lower(xyd.lang))
end

function PartnerChallengeTypeTable:getName(type)
	return self:getString(type, "name")
end

function PartnerChallengeTypeTable:getDesc(type)
	return self:getString(type, "desc")
end

return PartnerChallengeTypeTable
