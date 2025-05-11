-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CollectionTextTable.lua

local CollectionTextTable = class("CollectionTextTable", import("app.common.tables.BaseTable"))

function CollectionTextTable:ctor()
	CollectionTextTable.super.ctor(self, "collection_text_" .. tostring(xyd.Global.lang))

	self.ids = {}

	if self.TableLua then
		for id, _ in pairs(self.TableLua.rows) do
			table.insert(self.ids, tonumber(id))
		end
	end
end

function CollectionTextTable:getName(id)
	return self:getString(id, "name")
end

function CollectionTextTable:getDesc(id)
	return self:getString(id, "desc") or ""
end

return CollectionTextTable
