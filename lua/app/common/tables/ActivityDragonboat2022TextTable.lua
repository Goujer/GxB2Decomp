-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDragonboat2022TextTable.lua

local ActivityDragonboat2022TextTable = class("ActivityDragonboat2022TextTable", import("app.common.tables.BaseTable"))

function ActivityDragonboat2022TextTable:ctor()
	ActivityDragonboat2022TextTable.super.ctor(self, "activity_dragonboat2022_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityDragonboat2022TextTable:getIDs()
	return self.ids_
end

function ActivityDragonboat2022TextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityDragonboat2022TextTable
