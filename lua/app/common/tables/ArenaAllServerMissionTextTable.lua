-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaAllServerMissionTextTable.lua

local ArenaAllServerMissionTextTable = class("ArenaAllServerMissionTextTable", import("app.common.tables.BaseTable"))

function ArenaAllServerMissionTextTable:ctor()
	ArenaAllServerMissionTextTable.super.ctor(self, "arena_all_server_mission_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArenaAllServerMissionTextTable:getIDs()
	return self.ids_
end

function ArenaAllServerMissionTextTable:getDesc(id, ...)
	return self:getSpecialParamsDesc(id, "desc", ...)
end

return ArenaAllServerMissionTextTable
