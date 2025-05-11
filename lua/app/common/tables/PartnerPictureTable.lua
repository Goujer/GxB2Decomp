-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerPictureTable.lua

local PartnerPictureTable = class("PartnerPictureTable", import("app.common.tables.BaseTable"))

function PartnerPictureTable:ctor()
	PartnerPictureTable.super.ctor(self, "partner_picture")

	self.pic_src2id_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		self.pic_src2id_[self:getPartnerPic(id)] = tonumber(id)
	end
end

function PartnerPictureTable:starPictureScale(id)
	local scale = self:getNumber(id, "star_picture_scale")

	scale = scale ~= 0 and scale or 1

	return scale
end

function PartnerPictureTable:starPictureXy(id)
	return self:split2num(id, "star_picture_xy", "|")
end

function PartnerPictureTable:partnerPictureXy2(id)
	return self:split2num(id, "partner_picture_xy2", "|")
end

function PartnerPictureTable:getPartnerPicXY(id)
	local pos = xyd.split(self:getString(id, "partner_picture_xy"), "|", true)

	return {
		x = pos[1],
		y = pos[2]
	}
end

function PartnerPictureTable:getPartnerCard(id)
	return self:getString(id, "partner_card")
end

function PartnerPictureTable:getPartnerPic(id)
	return self:getString(id, "partner_picture")
end

function PartnerPictureTable:getDragonBone(id)
	return self:getNumber(id, "dragon_bone")
end

function PartnerPictureTable:getPartnerPicScale(id)
	local scale = self:getNumber(id, "partner_picture_scale")

	scale = scale ~= 0 and scale or 1

	return scale
end

function PartnerPictureTable:getFace(id)
	return self:getNumber(id, "face")
end

function PartnerPictureTable:getFacePos(id)
	local pos = xyd.split(self:getString(id, "face_pos"), "|", true)

	return {
		x = pos[1],
		y = pos[2]
	}
end

function PartnerPictureTable:getSkinPartner(id)
	return self:split2num(id, "partner_id", "|")
end

function PartnerPictureTable:getShowTime(id)
	return self:getNumber(id, "show_in_guide")
end

function PartnerPictureTable:getIdByPartnerPicture(src)
	return self.pic_src2id_[src]
end

function PartnerPictureTable:getIsWedding(id)
	return self:getNumber(id, "is_wedding") == 1
end

function PartnerPictureTable:getHandType(id)
	return self:getNumber(id, "hand_type")
end

function PartnerPictureTable:getShowByCamera(id)
	return self:getNumber(id, "show_by_camera")
end

function PartnerPictureTable:getShowEffectScale(id)
	local scale = self:getNumber(id, "show_scale")

	if not scale or scale == 0 then
		return 1
	else
		return scale
	end
end

function PartnerPictureTable:getShowScaleSpecial(id)
	local scale = self:getNumber(id, "show_scale_special")

	if not scale or scale == 0 then
		return 1
	else
		return scale
	end
end

return PartnerPictureTable
