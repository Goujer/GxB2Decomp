-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CustomBackgroundGroupTable.lua

local CustomBackgroundGroupTable = class("CustomBackgroundGroupTable", import("app.common.tables.BaseTable"))

function CustomBackgroundGroupTable:ctor()
	CustomBackgroundGroupTable.super.ctor(self, "custom_background_group")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, id)
	end

	table.sort(self.ids)
end

function CustomBackgroundGroupTable:getIDs()
	return self.ids
end

function CustomBackgroundGroupTable:getCover(id)
	return self:getString(id, "cover")
end

return CustomBackgroundGroupTable
