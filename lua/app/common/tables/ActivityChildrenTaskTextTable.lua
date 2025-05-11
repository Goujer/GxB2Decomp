-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChildrenTaskTextTable.lua

local ActivityChildrenTaskTextTable = class("ActivityChildrenTaskTextTable", import("app.common.tables.BaseTable"))

function ActivityChildrenTaskTextTable:ctor()
	ActivityChildrenTaskTextTable.super.ctor(self, "activity_children_task_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityChildrenTaskTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityChildrenTaskTextTable
