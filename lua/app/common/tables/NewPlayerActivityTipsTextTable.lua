-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewPlayerActivityTipsTextTable.lua

local NewPlayerActivityTipsTextTable = class("NewPlayerActivityTipsTextTable", import("app.common.tables.BaseTable"))

function NewPlayerActivityTipsTextTable:ctor()
	NewPlayerActivityTipsTextTable.super.ctor(self, "new_player_activity_tips_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function NewPlayerActivityTipsTextTable:getIDs()
	return self.ids_
end

function NewPlayerActivityTipsTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function NewPlayerActivityTipsTextTable:getButton(id)
	return self:getString(id, "button")
end

function NewPlayerActivityTipsTextTable:getTitle(id)
	return self:getString(id, "title")
end

return NewPlayerActivityTipsTextTable
