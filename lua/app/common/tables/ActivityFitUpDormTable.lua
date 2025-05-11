-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFitUpDormTable.lua

local ActivityFitUpDormTable = class("ActivityFitUpDormTable", import("app.common.tables.BaseTable"))

function ActivityFitUpDormTable:ctor()
	ActivityFitUpDormTable.super.ctor(self, "activity_fit_up_dorm")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityFitUpDormTable:getIDs()
	return self.ids
end

function ActivityFitUpDormTable:getCompleteAwards(id)
	return self:split2Cost(id, "complete_awards", "|#")
end

function ActivityFitUpDormTable:getSlotNum(id)
	return self:getNumber(id, "slot_num")
end

function ActivityFitUpDormTable:getCost(id, index)
	return self:split2Cost(id, "cost_" .. tostring(index), "#")
end

function ActivityFitUpDormTable:getAwards(id, index)
	return self:split2Cost(id, "awards_" .. tostring(index), "|#")
end

function ActivityFitUpDormTable:getPic(id, index)
	return self:getString(id, "pic_" .. tostring(index))
end

function ActivityFitUpDormTable:getTitle(id)
	return xyd.tables.activityFitUpDormTextTable:getTitle(id)
end

function ActivityFitUpDormTable:getTitleOver(id)
	return xyd.tables.activityFitUpDormTextTable:getTitleOver(id)
end

function ActivityFitUpDormTable:getSlotName(id, index)
	return xyd.tables.activityFitUpDormTextTable:getSlotName(id, index)
end

return ActivityFitUpDormTable
