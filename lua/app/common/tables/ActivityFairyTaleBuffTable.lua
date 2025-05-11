-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleBuffTable.lua

local ActivityFairyTaleBuffTable = class("ActivityFairyTaleBuffTable", import(".BaseTable"))

function ActivityFairyTaleBuffTable:ctor()
	ActivityFairyTaleBuffTable.super.ctor(self, "activity_fairytale_buff")

	self.ids_ = {}
	self.showids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		if self:getBuffType(id) == 1 then
			table.insert(self.showids_, tonumber(id))
		end
	end

	table.sort(self.ids_)
	table.sort(self.showids_)
end

function ActivityFairyTaleBuffTable:getIds()
	return self.ids_
end

function ActivityFairyTaleBuffTable:getShowIds()
	return self.showids_
end

function ActivityFairyTaleBuffTable:getBuffType(id)
	return self:getNumber(id, "buff_type")
end

function ActivityFairyTaleBuffTable:getFx(id)
	return self:getString(id, "fx")
end

function ActivityFairyTaleBuffTable:getSkillIds(id)
	return self:split2num(id, "skill", "|")
end

function ActivityFairyTaleBuffTable:getName(id)
	return xyd.tables.activityFairyTaleBuffTextTable:getName(id)
end

function ActivityFairyTaleBuffTable:getDesc(id)
	return xyd.tables.activityFairyTaleBuffTextTable:getDesc(id)
end

return ActivityFairyTaleBuffTable
