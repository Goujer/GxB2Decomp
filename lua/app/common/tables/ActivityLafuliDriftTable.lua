-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLafuliDriftTable.lua

local ActivityLafuliDriftTable = class("ActivityLafuliDriftTable", import("app.common.tables.BaseTable"))

function ActivityLafuliDriftTable:ctor()
	ActivityLafuliDriftTable.super.ctor(self, "activity_lafuli_drift")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
	table.remove(self.ids)
end

function ActivityLafuliDriftTable:getIDs()
	return self.ids
end

function ActivityLafuliDriftTable:getIcon(id)
	return self:getString(id, "icon_png")
end

function ActivityLafuliDriftTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityLafuliDriftTable:getAward(id, level)
	return self:split2Cost(id, "award" .. level, "#")
end

function ActivityLafuliDriftTable:getFixedAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityLafuliDriftTable:getTipPos(id)
	return self:split2Cost(id, "pos", "|")
end

function ActivityLafuliDriftTable:getTextID(id)
	return self:getNumber(id, "text_id")
end

function ActivityLafuliDriftTable:getBgID(id)
	return self:getNumber(id, "bg_png")
end

return ActivityLafuliDriftTable
