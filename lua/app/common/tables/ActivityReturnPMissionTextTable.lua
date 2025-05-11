-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityReturnPMissionTextTable.lua

local ActivityReturnPMissionTextTable = class("ActivityReturnPMissionTextTable", import(".BaseTable"))

function ActivityReturnPMissionTextTable:ctor()
	ActivityReturnPMissionTextTable.super.ctor(self, "activity_return_pmission_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityReturnPMissionTextTable:getDesc(id)
	return self:getString(tostring(id), "desc")
end

return ActivityReturnPMissionTextTable
