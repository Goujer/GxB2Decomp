-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/WindowGoOperationMapTable.lua

local WindowGoOperationMapTable = class("WindowGoOperationMapTable", import("app.common.tables.BaseTable"))

function WindowGoOperationMapTable:ctor()
	WindowGoOperationMapTable.super.ctor(self, "window_go_operation_map")
	self:parseTable(nil, true)
end

function WindowGoOperationMapTable:getIds()
	return self.ids_
end

function WindowGoOperationMapTable:getType(id)
	return self:getNumber(id, "type")
end

function WindowGoOperationMapTable:getValue(id)
	return self:getNumber(id, "value")
end

function WindowGoOperationMapTable:getWindowGoId(id)
	return self:getNumber(id, "go_window_id")
end

return WindowGoOperationMapTable
