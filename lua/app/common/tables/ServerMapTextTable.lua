-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ServerMapTextTable.lua

local ServerMapTextTable = class("ServerMapTextTable", import("app.common.tables.BaseTable"))

function ServerMapTextTable:ctor()
	ServerMapTextTable.super.ctor(self, "server_map_text_" .. tostring(xyd.Global.lang))
end

function ServerMapTextTable:getServerName(id)
	return self:getString(id, "server_name")
end

return ServerMapTextTable
