-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySecretTreasureEventTable.lua

local ActivitySecretTreasureEventTable = class("ActivitySecretTreasureEventTable", import("app.common.tables.BaseTable"))

function ActivitySecretTreasureEventTable:ctor()
	ActivitySecretTreasureEventTable.super.ctor(self, "activity_secrettreature_event")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivitySecretTreasureEventTable:getIDs()
	return self.ids_
end

function ActivitySecretTreasureEventTable:getIcon(id)
	return self:getString(id, "icon")
end

function ActivitySecretTreasureEventTable:getName(id)
	return self:getString(id, "name")
end

function ActivitySecretTreasureEventTable:getExtraItem(id)
	return self:split2Cost(id, "extra_item", "#")
end

return ActivitySecretTreasureEventTable
