-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StageFxXyTable.lua

local StageFxXyTable = class("StageFxXyTable", import("app.common.tables.BaseTable"))

function StageFxXyTable:ctor()
	StageFxXyTable.super.ctor(self, "stage_fx_xy")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function StageFxXyTable:getXy(id)
	return self:split(id, "stage_fx_xy", "|")
end

return StageFxXyTable
