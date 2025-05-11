-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLflcastleTaskTextTable.lua

local ActivityLflcastleTaskTextTable = class("ActivityLflcastleTaskTextTable", import("app.common.tables.BaseTable"))

function ActivityLflcastleTaskTextTable:ctor()
	ActivityLflcastleTaskTextTable.super.ctor(self, "activity_lflcastle_task_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLflcastleTaskTextTable:getIDs()
	return self.ids_
end

function ActivityLflcastleTaskTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityLflcastleTaskTextTable
