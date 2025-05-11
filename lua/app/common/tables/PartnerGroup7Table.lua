-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerGroup7Table.lua

local PartnerGroup7Table = class("PartnerGroup7Table", import("app.common.tables.BaseTable"))

function PartnerGroup7Table:ctor()
	PartnerGroup7Table.super.ctor(self, "partner_group7")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function PartnerGroup7Table:getIDs()
	return self.ids_
end

function PartnerGroup7Table:getStarOriginImg1(id)
	return self:getString(id, "star_origin_img1")
end

function PartnerGroup7Table:getStarOriginImg2(id)
	return self:getString(id, "star_origin_img2")
end

function PartnerGroup7Table:getExMaterial(id, awake)
	if awake ~= nil then
		local str = xyd.split(self:getString(id, "ex_material"), "|")[awake + 1]

		return xyd.split(str, "#", true)
	else
		return self:getString(id, "ex_material")
	end
end

return PartnerGroup7Table
