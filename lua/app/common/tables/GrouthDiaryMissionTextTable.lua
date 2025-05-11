-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GrouthDiaryMissionTextTable.lua

local GrouthDiaryMissionTextTable = class("ActivityChimeMissionTextTable", import("app.common.tables.BaseTable"))

function GrouthDiaryMissionTextTable:ctor()
	GrouthDiaryMissionTextTable.super.ctor(self, "growth_diary_mission_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GrouthDiaryMissionTextTable:getIDs()
	return self.ids_
end

function GrouthDiaryMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GrouthDiaryMissionTextTable
