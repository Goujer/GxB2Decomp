-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ServerMapTable.lua

local ServerMapTable = class("ServerMapTable", import("app.common.tables.BaseTable"))

function ServerMapTable:ctor()
	ServerMapTable.super.ctor(self, "server_map")
end

function ServerMapTable:getServerName(id)
	return xyd.tables.serverMapTextTable:getServerName(id)
end

function ServerMapTable:getIdText(id)
	return self:getString(id, "id_text")
end

function ServerMapTable:getHostShow(id)
	return self:getNumber(id, "host_mix_show")
end

function ServerMapTable:getHostMix(id)
	return self:getNumber(id, "host_mix")
end

function ServerMapTable:getTimeHostMix(id)
	local updateData = xyd.tables.miscTable:split2num("merge_server_now_next", "value", "|")

	if xyd.getServerTime() >= updateData[3] then
		if id > updateData[1] and id <= updateData[2] then
			return self:getHostShow(id)
		else
			self:getHostMix(id)
		end
	else
		return self:getHostMix(id)
	end
end

return ServerMapTable
