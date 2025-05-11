-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSecretMissionTextTable.lua

local BaseTable = import(".BaseTable")
local ActivityIceSecretMissionTextTable = class("ActivityIceSecretMissionTextTable", BaseTable)

function ActivityIceSecretMissionTextTable:ctor()
	BaseTable.ctor(self, "activity_ice_secret_mission_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityIceSecretMissionTextTable:getIds()
	return self.ids_
end

function ActivityIceSecretMissionTextTable:getDescription(id)
	return self:getString(id, "desc")
end

return ActivityIceSecretMissionTextTable
