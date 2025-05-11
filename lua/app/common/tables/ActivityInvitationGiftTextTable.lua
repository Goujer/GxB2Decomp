-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityInvitationGiftTextTable.lua

local ActivityInvitationGiftTextTable = class("ActivityInvitationGiftTextTable", import("app.common.tables.BaseTable"))

function ActivityInvitationGiftTextTable:ctor()
	ActivityInvitationGiftTextTable.super.ctor(self, "activity_invitation_gift_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityInvitationGiftTextTable:getIDs()
	return self.ids_
end

function ActivityInvitationGiftTextTable:getLv(id)
	return self:getNumber(id, "lv")
end

function ActivityInvitationGiftTextTable:getText(id)
	return self:getString(id, "text")
end

return ActivityInvitationGiftTextTable
