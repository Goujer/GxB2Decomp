-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySecretTreasureHuntEventTextTable.lua

local ActivitySecretTreasureHuntEventTextTable = class("ActivitySecretTreasureHuntEventTextTable", import("app.common.tables.BaseTable"))

function ActivitySecretTreasureHuntEventTextTable:ctor()
	ActivitySecretTreasureHuntEventTextTable.super.ctor(self, "activity_treasure_event_text_" .. xyd.Global.lang)

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivitySecretTreasureHuntEventTextTable:getIDs()
	return self.ids_
end

function ActivitySecretTreasureHuntEventTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivitySecretTreasureHuntEventTextTable:getDes(id)
	return self:getString(id, "des")
end

function ActivitySecretTreasureHuntEventTextTable:getShowID(id)
	return self:getNumber(id, "sort")
end

return ActivitySecretTreasureHuntEventTextTable
