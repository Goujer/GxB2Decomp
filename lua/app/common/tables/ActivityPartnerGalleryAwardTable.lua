-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPartnerGalleryAwardTable.lua

local ActivityPartnerGalleryAwardTable = class("ActivityPartnerGalleryAwardTable", import(".BaseTable"))

function ActivityPartnerGalleryAwardTable:ctor()
	ActivityPartnerGalleryAwardTable.super.ctor(self, "activity_partner_gallery_award")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityPartnerGalleryAwardTable:getIDs()
	return self.ids
end

function ActivityPartnerGalleryAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityPartnerGalleryAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ActivityPartnerGalleryAwardTable
