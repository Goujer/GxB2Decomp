-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsAchvTypeTable.lua

local ActivitySportsAchvTypeTable = class("ActivitySportsAchvTypeTable", import("app.common.tables.BaseTable"))

function ActivitySportsAchvTypeTable:ctor()
	ActivitySportsAchvTypeTable.super.ctor(self, "activity_sports_achv_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySportsAchvTypeTable:getDesc(id, ...)
	return xyd.tables.achievementTextTable:getDesc(id, ...)
end

return ActivitySportsAchvTypeTable
