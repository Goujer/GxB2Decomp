-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TrialOffsetTable.lua

local TrialOffsetTable = class("TrialOffsetTable", import("app.common.tables.BaseTable"))

function TrialOffsetTable:ctor()
	TrialOffsetTable.super.ctor(self, "trial_offset")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end
end

function TrialOffsetTable:getIds()
	return self.ids_
end

function TrialOffsetTable:getType(id)
	return self:getNumber(id, "type")
end

function TrialOffsetTable:getOffsetX(id)
	return self:getNumber(id, "offsetX")
end

function TrialOffsetTable:getOffsetY(id)
	return self:getNumber(id, "offsetY")
end

function TrialOffsetTable:getStage(id)
	return self:getNumber(id, "stage_belong")
end

return TrialOffsetTable
