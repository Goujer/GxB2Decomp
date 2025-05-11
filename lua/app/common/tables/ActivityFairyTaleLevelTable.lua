-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleLevelTable.lua

local ActivityFairyTaleLevelTable = class("ActivityFairyTaleLevelTable", import(".BaseTable"))

function ActivityFairyTaleLevelTable:ctor()
	ActivityFairyTaleLevelTable.super.ctor(self, "activity_fairytale_level")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairyTaleLevelTable:getMissionIds(id)
	return self:split2Cost(id, "mission_id", "|")
end

function ActivityFairyTaleLevelTable:getSkillIds(id)
	return self:split2num(id, "buff_ids", "|")
end

function ActivityFairyTaleLevelTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityFairyTaleLevelTable:getIds()
	return self.ids_
end

return ActivityFairyTaleLevelTable
