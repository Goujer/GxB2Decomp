-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/LoadingTipsTextTable.lua

local LoadingTipsTextTable = class("LoadingTipsTextTable", import("app.common.tables.BaseTable"))

function LoadingTipsTextTable:ctor()
	LoadingTipsTextTable.super.ctor(self, "loading_tips_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end
end

function LoadingTipsTextTable:getTips(id)
	return self:getString(id, "tips")
end

function LoadingTipsTextTable:getIDs()
	return self.ids_
end

return LoadingTipsTextTable
