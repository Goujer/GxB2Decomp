-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDressGachaAwardTextTable.lua

local ActivityDressGachaAwardTextTable = class("ActivityDressGachaAwardTextTable", import("app.common.tables.BaseTable"))

function ActivityDressGachaAwardTextTable:ctor()
	ActivityDressGachaAwardTextTable.super.ctor(self, "activity_dress_gacha_award_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityDressGachaAwardTextTable:getIDs()
	return self.ids_
end

function ActivityDressGachaAwardTextTable:getTaskDesc(id)
	return self:getString(id, "task_desc")
end

return ActivityDressGachaAwardTextTable
