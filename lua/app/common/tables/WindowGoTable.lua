-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/WindowGoTable.lua

local WindowGoTable = class("WindowGoTable", import("app.common.tables.BaseTable"))
local cjson = require("cjson")

function WindowGoTable:ctor()
	WindowGoTable.super.ctor(self, "window_go")
end

function WindowGoTable:getWindowName(id)
	return self:getString(id, "name")
end

function WindowGoTable:getFunctionId(id)
	return self:getNumber(id, "function_id")
end

function WindowGoTable:getActivityId(id)
	return self:getNumber(id, "activity_id")
end

function WindowGoTable:getParams(id)
	local params = {}
	local str = self:getString(id, "params")

	if str and #str > 0 then
		str = string.gsub(str, "'", "\"")
		params = cjson.decode(str)
	end

	return params
end

return WindowGoTable
