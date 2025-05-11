-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGamblePlusMissionTextTable.lua

local ActivityGamblePlusMissionTextTable = class("ActivityGamblePlusMissionTextTable", import("app.common.tables.BaseTable"))

function ActivityGamblePlusMissionTextTable:ctor()
	ActivityGamblePlusMissionTextTable.super.ctor(self, "activity_gamble_mission_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityGamblePlusMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityGamblePlusMissionTextTable
