-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySecretTreasureAwardTable.lua

local ActivitySecretTreasureAwardTable = class("ActivitySecretTreasureAwardTable", import("app.common.tables.BaseTable"))

function ActivitySecretTreasureAwardTable:ctor()
	ActivitySecretTreasureAwardTable.super.ctor(self, "activity_secrettreasure_award")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivitySecretTreasureAwardTable:getIDs()
	return self.ids_
end

function ActivitySecretTreasureAwardTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivitySecretTreasureAwardTable:getLight(id)
	return self:getNumber(id, "light")
end

return ActivitySecretTreasureAwardTable
