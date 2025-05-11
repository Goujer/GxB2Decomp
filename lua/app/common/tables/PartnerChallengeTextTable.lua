-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeTextTable.lua

local BaseTable = import(".BaseTable")
local PartnerChallengeTextTable = class("PartnerChallengeTextTable", BaseTable)

function PartnerChallengeTextTable:ctor()
	BaseTable.ctor(self, "partner_challenge_text_" .. tostring(xyd.Global.lang))
end

function PartnerChallengeTextTable:get()
	if PartnerChallengeTextTable.INSTANCE == nil then
		PartnerChallengeTextTable.INSTANCE = PartnerChallengeTextTable.new()
	end

	return PartnerChallengeTextTable.INSTANCE
end

function PartnerChallengeTextTable:reset()
	if PartnerChallengeTextTable.INSTANCE == nil then
		return
	end

	PartnerChallengeTextTable.INSTANCE = nil
end

function PartnerChallengeTextTable:fortName(id)
	return self:getString(id, "fort_name")
end

function PartnerChallengeTextTable:fortName2(id)
	return self:getString(id, "fort_name2")
end

function PartnerChallengeTextTable:name(id)
	return self:getString(id, "name")
end

function PartnerChallengeTextTable:description(id)
	return self:getString(id, "description")
end

function PartnerChallengeTextTable:getName(id)
	return self:getString(id, "name")
end

function PartnerChallengeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function PartnerChallengeTextTable:getSkillDesc(id)
	return self:getString(id, "skill")
end

return PartnerChallengeTextTable
