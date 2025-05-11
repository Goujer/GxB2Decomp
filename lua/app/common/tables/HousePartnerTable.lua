-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HousePartnerTable.lua

local HousePartnerTable = class("HousePartnerTable", import("app.common.tables.BaseTable"))

function HousePartnerTable:ctor()
	HousePartnerTable.super.ctor(self, "house_partner")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function HousePartnerTable:getIDs()
	return self.ids_
end

function HousePartnerTable:checkCanAdd(id)
	return xyd.arrayIndexOf(self.ids_, id) > -1
end

function HousePartnerTable:sitPosOffset(id)
	return self:split2num(id, "sit_pos_offset", "|") or xyd.split(xyd.tables.miscTable:getVal("house_senpai_sit"), "|", true)
end

function HousePartnerTable:liePosOffset(id)
	return self:split2num(id, "lie_pos_offset", "|") or xyd.split(xyd.tables.miscTable:getVal("house_senpai_lie"), "|", true)
end

function HousePartnerTable:idlePosOffset(id)
	local posArr = self:split2num(id, "idle_pos_offset", "|")

	if posArr == nil or posArr and #posArr == 0 then
		return xyd.split(xyd.tables.miscTable:getVal("house_senpai_offset_idle"), "|", true)
	end

	return posArr
end

function HousePartnerTable:isRide(id)
	return self:getNumber(id, "is_ride") == 1
end

function HousePartnerTable:houseIdleNum(id)
	return self:getNumber(id, "house_idle_num")
end

return HousePartnerTable
