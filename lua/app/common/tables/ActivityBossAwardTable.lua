-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBossAwardTable.lua

local ActivityBossAwardTable = class("ActivityBossAwardTable", import("app.common.tables.BaseTable"))

function ActivityBossAwardTable:ctor()
	ActivityBossAwardTable.super.ctor(self, "activity_boss_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityBossAwardTable:getIDs()
	return self.ids
end

function ActivityBossAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityBossAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityBossAwardTable.INSTANCE
