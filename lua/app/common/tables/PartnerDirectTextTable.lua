-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerDirectTextTable.lua

local BaseTable = import(".BaseTable")
local PartnerDirectTextTable = class("PartnerDirectTextTable", BaseTable)

function PartnerDirectTextTable:ctor()
	PartnerDirectTextTable.super.ctor(self, "direct_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}
end

function PartnerDirectTextTable:getName(id)
	return self:getString(id, "name")
end

function PartnerDirectTextTable:getBrief(id)
	return self:getString(id, "brief")
end

function PartnerDirectTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function PartnerDirectTextTable:getSkillName(id, index)
	return self:getString(id, "skill_name" .. tostring(index))
end

function PartnerDirectTextTable:getSkillDesc(id, index)
	return self:getString(id, "skill_desc" .. tostring(index))
end

function PartnerDirectTextTable:getArtifactName(id, index)
	return self:getString(id, "artifact_name" .. tostring(index))
end

function PartnerDirectTextTable:getArtifactDesc(id, index)
	return self:getString(id, "artifact_desc" .. tostring(index))
end

return PartnerDirectTextTable
