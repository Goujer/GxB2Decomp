-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4BirthdayMissionTextTable.lua

local Activity4BirthdayMissionTextTable = class("Activity4BirthdayMissionTextTable", import("app.common.tables.BaseTable"))

function Activity4BirthdayMissionTextTable:ctor()
	Activity4BirthdayMissionTextTable.super.ctor(self, "activity_4birthday_task_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity4BirthdayMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return Activity4BirthdayMissionTextTable
