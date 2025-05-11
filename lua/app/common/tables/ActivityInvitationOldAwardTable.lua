-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityInvitationOldAwardTable.lua

local ActivityInvitationOldAwardTable = class("ActivityInvitationOldAwardTable", import("app.common.tables.BaseTable"))

function ActivityInvitationOldAwardTable:ctor()
	ActivityInvitationOldAwardTable.super.ctor(self, "activity_invitation_old_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityInvitationOldAwardTable:getIDs()
	return self.ids_
end

function ActivityInvitationOldAwardTable:getParameter(id)
	return self:split2Cost(id, "complete_value", "|", true)
end

function ActivityInvitationOldAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityInvitationOldAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

return ActivityInvitationOldAwardTable
