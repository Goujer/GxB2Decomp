-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityReturnTMissionTextTable.lua

local ActivityReturnTMissionTextTable = class("ActivityReturnTMissionTextTable", import(".BaseTable"))

function ActivityReturnTMissionTextTable:ctor()
	ActivityReturnTMissionTextTable.super.ctor(self, "activity_return_tmission_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityReturnTMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityReturnTMissionTextTable
