-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerDialogTable.lua

local PartnerDialogTable = class("PartnerDialogTable", import("app.common.tables.BaseTable"))

function PartnerDialogTable:ctor()
	PartnerDialogTable.super.ctor(self, "partner_dialog")

	self.ids_ = {}
	self.dialogsByID_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local partnerID = self:getPartnerID(id)

		if not self.dialogsByID_[partnerID] then
			self.dialogsByID_[partnerID] = {}
		end

		if self:isExtra(id) == 1 then
			-- block empty
		else
			table.insert(self.dialogsByID_[partnerID], tonumber(id))
		end
	end

	table.sort(self.ids_)

	for _, ids in pairs(self.dialogsByID_) do
		table.sort(ids)
	end
end

function PartnerDialogTable:getSoundTableId(id)
	return self:getNumber(id, "sound")
end

function PartnerDialogTable:isExtra(id)
	return self:getNumber(id, "is_extra")
end

function PartnerDialogTable:getDialogList(partnerID)
	return self.dialogsByID_[partnerID] or {}
end

function PartnerDialogTable:getPartnerID(id)
	return self:getNumber(id, "partner_id")
end

function PartnerDialogTable:getSoundType(id)
	return self:getNumber(id, "type")
end

function PartnerDialogTable:getCondition(id)
	return self:split2Cost(id, "condition")
end

function PartnerDialogTable:getDialog(id)
	return self:getString(id, "text")
end

function PartnerDialogTable:getSkinSound(id, index)
	local soundSkinList = self:split2num(id, "skin_overides", "|")

	return xyd.checkCondition(soundSkinList[index] and tonumber(soundSkinList[index]) > 0, soundSkinList[index], -1)
end

function PartnerDialogTable:getIdsInList(Idlist, type_, skinIndex)
	local list = {}

	if Idlist == nil then
		return list
	end

	for _, id in ipairs(Idlist) do
		if id and tonumber(id) > 0 then
			local type_new = self:getSoundType(id)

			if type_new == tonumber(type_) then
				if skinIndex and tonumber(skinIndex) > 0 and tonumber(self:getSkinSound(id, skinIndex)) > 0 then
					table.insert(list, self:getSkinSound(id, skinIndex))
				else
					table.insert(list, id)
				end
			end
		end
	end

	if #list == 1 then
		return list[1]
	else
		return list
	end
end

return PartnerDialogTable
