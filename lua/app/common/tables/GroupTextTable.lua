-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GroupTextTable.lua

local GroupTextTable = class("GroupTextTable", import("app.common.tables.BaseTable"))

function GroupTextTable:ctor()
	GroupTextTable.super.ctor(self, "group_text_" .. tostring(xyd.Global.lang))
end

function GroupTextTable:getName(id)
	return self:getString(id, "name")
end

function GroupTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GroupTextTable
