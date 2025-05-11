-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaAllServerAwardTextTable.lua

local ArenaAllServerAwardTextTable = class("ArenaAllServerAwardTextTable", import("app.common.tables.BaseTable"))

function ArenaAllServerAwardTextTable:ctor()
	ArenaAllServerAwardTextTable.super.ctor(self, "arena_all_server_award_text_" .. string.lower(xyd.lang))
end

function ArenaAllServerAwardTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ArenaAllServerAwardTextTable
