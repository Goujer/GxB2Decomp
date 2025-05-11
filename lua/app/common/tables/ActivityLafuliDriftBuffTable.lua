-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLafuliDriftBuffTable.lua

local ActivityLafuliDriftBuffTable = class("ActivityLafuliDriftBuffTable", import("app.common.tables.BaseTable"))

function ActivityLafuliDriftBuffTable:ctor()
	ActivityLafuliDriftBuffTable.super.ctor(self, "activity_lafuli_buff")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityLafuliDriftBuffTable:getIDs()
	return self.ids
end

function ActivityLafuliDriftBuffTable:getParams(id)
	return self:split2Cost(id, "params", "#")
end

function ActivityLafuliDriftBuffTable:getTextID(id)
	return self:getNumber(id, "text_id")
end

function ActivityLafuliDriftBuffTable:getIcon(id)
	return self:getString(id, "icon")
end

return ActivityLafuliDriftBuffTable
