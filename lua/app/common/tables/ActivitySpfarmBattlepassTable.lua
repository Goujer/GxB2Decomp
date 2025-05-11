-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmBattlepassTable.lua

local ActivitySpfarmBattlepassTable = class("ActivitySpfarmBattlepassTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmBattlepassTable:ctor()
	ActivitySpfarmBattlepassTable.super.ctor(self, "activity_spfarm_battlepass")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmBattlepassTable:getIDs()
	return self.ids_
end

function ActivitySpfarmBattlepassTable:getNeedLevel(id)
	return self:getNumber(id, "num")
end

function ActivitySpfarmBattlepassTable:getNormalAward(id)
	return self:split2Cost(id, "free_award", "|#")
end

function ActivitySpfarmBattlepassTable:getPaidAward(id)
	return self:split2Cost(id, "paid_award", "|#")
end

return ActivitySpfarmBattlepassTable
