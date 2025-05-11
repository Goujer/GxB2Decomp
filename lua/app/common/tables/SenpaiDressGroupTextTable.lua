-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressGroupTextTable.lua

local SenpaiDressGroupTextTable = class("SenpaiDressGroupTextTable", import("app.common.tables.BaseTable"))

function SenpaiDressGroupTextTable:ctor()
	SenpaiDressGroupTextTable.super.ctor(self, "senpai_dress_group_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressGroupTextTable:getIDs()
	return self.ids_
end

function SenpaiDressGroupTextTable:getName(id)
	return self:getString(id, "name")
end

return SenpaiDressGroupTextTable
