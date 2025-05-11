-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerArrayTable.lua

local BaseTable = import(".BaseTable")
local PartnerArrayTable = class("PartnerArrayTable", BaseTable)

function PartnerArrayTable:ctor()
	PartnerArrayTable.super.ctor(self, "direct_array")
end

function PartnerArrayTable:getReasonText(id)
	return xyd.tables.partnerArrayTextTable:getReasonText(id)
end

function PartnerArrayTable:getName(id)
	return xyd.tables.partnerArrayTextTable:getName(id)
end

function PartnerArrayTable:getPoint(id, index)
	return self:getNumber(id, "point_" .. tostring(index))
end

function PartnerArrayTable:getPet(id, index)
	return self:getNumber(id, "pet_" .. tostring(index))
end

function PartnerArrayTable:getMonster(id, index)
	return self:split2num(id, "monsters_" .. tostring(index), "|")
end

return PartnerArrayTable
