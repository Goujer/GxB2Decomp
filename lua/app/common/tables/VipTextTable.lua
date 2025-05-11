-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/VipTextTable.lua

local VipTextTable = class("VipTextTable", import("app.common.tables.BaseTable"))

function VipTextTable:ctor()
	VipTextTable.super.ctor(self, "vip_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function VipTextTable:getIds()
	return self.ids_
end

function VipTextTable:getTitle(id)
	return self:getString(id, "title")
end

function VipTextTable:getText(id)
	return self:getString(id, "text")
end

return VipTextTable
