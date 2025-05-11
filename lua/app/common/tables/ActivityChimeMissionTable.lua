-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChimeMissionTable.lua

local ActivityChimeMissionTable = class("ActivityChimeMissionTable", import("app.common.tables.BaseTable"))

function ActivityChimeMissionTable:ctor()
	ActivityChimeMissionTable.super.ctor(self, "activity_chime_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityChimeMissionTable:getIDs()
	return self.ids_
end

function ActivityChimeMissionTable:getDesc(id)
	return self:getString(id, "desc")
end

function ActivityChimeMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityChimeMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityChimeMissionTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

function ActivityChimeMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ActivityChimeMissionTable
