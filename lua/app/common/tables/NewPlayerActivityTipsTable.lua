-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewPlayerActivityTipsTable.lua

local NewPlayerActivityTipsTable = class("NewPlayerActivityTipsTable", import("app.common.tables.BaseTable"))

function NewPlayerActivityTipsTable:ctor()
	NewPlayerActivityTipsTable.super.ctor(self, "new_player_activity_tips")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function NewPlayerActivityTipsTable:getIDs()
	return self.ids_
end

function NewPlayerActivityTipsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return NewPlayerActivityTipsTable
