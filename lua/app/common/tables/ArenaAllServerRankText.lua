-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaAllServerRankText.lua

local ArenaAllServerRankText = class("ArenaAllServerRankText", import("app.common.tables.BaseTable"))

function ArenaAllServerRankText:ctor()
	ArenaAllServerRankText.super.ctor(self, "arena_all_server_rank_text_" .. xyd.Global.lang)
end

function ArenaAllServerRankText:getDesc(id)
	return self:getString(id, "desc")
end

return ArenaAllServerRankText
