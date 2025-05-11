-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPartnerGalleryPointTable.lua

local ActivityPartnerGalleryPointTable = class("ActivityPartnerGalleryPointTable", import(".BaseTable"))

function ActivityPartnerGalleryPointTable:ctor()
	ActivityPartnerGalleryPointTable.super.ctor(self, "activity_partner_gallery_point")

	self.partnerIds = {}
	self.allPoint = 0

	for id in pairs(self.TableLua.rows) do
		table.insert(self.partnerIds, self:getPartnerId(id))

		self.allPoint = self.allPoint + self:getPoint(id)
	end

	table.sort(self.partnerIds, function(a, b)
		return self:getID(a) < self:getID(b)
	end)

	self.partnerListByGroup = {}
	self.partnerListByGroup[0] = {}

	for i = 1, #self.partnerIds, 2 do
		local list = {
			self.partnerIds[i],
			self.partnerIds[i + 1]
		}
		local group = xyd.tables.partnerTable:getGroup(self.partnerIds[i])

		if not self.partnerListByGroup[group] then
			self.partnerListByGroup[group] = {}
		end

		table.insert(self.partnerListByGroup[0], list)
		table.insert(self.partnerListByGroup[group], list)
	end
end

function ActivityPartnerGalleryPointTable:getPartnerListByGroup(group)
	return self.partnerListByGroup[group]
end

function ActivityPartnerGalleryPointTable:getID(partnerId)
	return self:getNumber(partnerId, "id")
end

function ActivityPartnerGalleryPointTable:getPoint(partnerId)
	return self:getNumber(partnerId, "point")
end

function ActivityPartnerGalleryPointTable:getPartnerId(partnerId)
	return self:getNumber(partnerId, "partner_id")
end

function ActivityPartnerGalleryPointTable:getAllPoint()
	return self.allPoint
end

return ActivityPartnerGalleryPointTable
