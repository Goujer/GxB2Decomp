-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySecretTreasureHuntMissionTextTable.lua

local BaseTable = import(".BaseTable")
local ActivitySecretTreasureHuntMissionTextTable = class("ActivitySecretTreasureHuntMissionTextTable", BaseTable)

function ActivitySecretTreasureHuntMissionTextTable:ctor()
	BaseTable.ctor(self, "activity_treasure_mission_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySecretTreasureHuntMissionTextTable:getIds()
	return self.ids_
end

function ActivitySecretTreasureHuntMissionTextTable:getDescription(id)
	return self:getString(id, "desc")
end

return ActivitySecretTreasureHuntMissionTextTable
