-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityInvitationAllAwardTable.lua

local ActivityInvitationAllAwardTable = class("ActivityInvitationAllAwardTable", import("app.common.tables.BaseTable"))

function ActivityInvitationAllAwardTable:ctor()
	ActivityInvitationAllAwardTable.super.ctor(self, "activity_invitation_all_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityInvitationAllAwardTable:getIDs()
	return self.ids_
end

function ActivityInvitationAllAwardTable:getParameter(id)
	return self:getNumber(id, "parameter")
end

function ActivityInvitationAllAwardTable:getAwardsNew(id)
	return self:split2Cost(id, "awards_new", "|#", true)
end

function ActivityInvitationAllAwardTable:getAwardsSenpai(id)
	return self:split2Cost(id, "awards_senpai", "|#", true)
end

function ActivityInvitationAllAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

return ActivityInvitationAllAwardTable
