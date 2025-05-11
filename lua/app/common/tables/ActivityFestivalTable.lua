-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFestivalTable.lua

local ActivityFestivalTabel = class("ActivityFestivalTabel", import("app.common.tables.BaseTable"))

function ActivityFestivalTabel:ctor()
	ActivityFestivalTabel.super.ctor(self, "activity_festival")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFestivalTabel:getIDs()
	return self.ids_
end

function ActivityFestivalTabel:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFestivalTabel:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityFestivalTabel:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityFestivalTabel:isHide(id)
	return self:getNumber(id, "is_hide")
end

function ActivityFestivalTabel:getAwardIcon(id)
	return self:getString(id, "awards_icon")
end

function ActivityFestivalTabel:getIsNew(id)
	return self:getNumber(id, "is_new")
end

function ActivityFestivalTabel:getAwardDesc(id)
	return xyd.tables.activityFestivalTextTable:getString(id, "awards_desc")
end

return ActivityFestivalTabel
