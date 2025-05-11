-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmAwardTable.lua

local ActivitySpfarmAwardTable = class("ActivitySpfarmAwardTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmAwardTable:ctor()
	ActivitySpfarmAwardTable.super.ctor(self, "activity_spfarm_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmAwardTable:getIds()
	return self.ids_
end

function ActivitySpfarmAwardTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivitySpfarmAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivitySpfarmAwardTable
