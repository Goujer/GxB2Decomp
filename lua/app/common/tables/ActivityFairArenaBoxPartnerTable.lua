-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairArenaBoxPartnerTable.lua

local ActivityFairArenaBoxPartnerTable = class("ActivityFairArenaBoxPartnerTable", import("app.common.tables.BaseTable"))

function ActivityFairArenaBoxPartnerTable:ctor()
	ActivityFairArenaBoxPartnerTable.super.ctor(self, "activity_fair_arena_box_partner")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairArenaBoxPartnerTable:getIDs()
	return self.ids_
end

function ActivityFairArenaBoxPartnerTable:getPartnerID(id)
	return self:getNumber(id, "partner_id")
end

function ActivityFairArenaBoxPartnerTable:getLv(id)
	return self:getNumber(id, "lv")
end

function ActivityFairArenaBoxPartnerTable:getGrade(id)
	return self:getNumber(id, "grade")
end

function ActivityFairArenaBoxPartnerTable:getEquips(id)
	return self:split2num(id, "equips", "|")
end

function ActivityFairArenaBoxPartnerTable:checkIsNew(id)
	return self:getNumber(id, "is_new") or 0
end

function ActivityFairArenaBoxPartnerTable:checkIsUp(id)
	return self:getNumber(id, "is_up") or 0
end

return ActivityFairArenaBoxPartnerTable
