-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GambleConfigTable.lua

local GambleConfigTable = class("WindowTable", import("app.common.tables.BaseTable"))

function GambleConfigTable:ctor()
	GambleConfigTable.super.ctor(self, "gamble_config")
end

function GambleConfigTable:needVip(id)
	return xyd.split(self:getString(id, "need_vip"), "|", true)
end

function GambleConfigTable:needLevel(id)
	return xyd.split(self:getString(id, "need_level"), "|", true)
end

function GambleConfigTable:getCost(id)
	return xyd.split(self:getString(id, "cost"), "|")
end

function GambleConfigTable:getRefresh(id)
	return xyd.split(self:getString(id, "refresh_cost"), "#", true)
end

function GambleConfigTable:getSystemTime(id)
	return self:getNumber(id, "system_refresh_time")
end

function GambleConfigTable:getFreeTime(id)
	return self:getNumber(id, "free_refresh_time")
end

return GambleConfigTable
