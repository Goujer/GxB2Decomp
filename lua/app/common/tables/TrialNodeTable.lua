-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TrialNodeTable.lua

local TrialNodeTable = class("TrialNodeTable", import("app.common.tables.BaseTable"))

function TrialNodeTable:ctor()
	TrialNodeTable.super.ctor(self, "trial_node")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end
end

function TrialNodeTable:getIds()
	return self.ids_
end

function TrialNodeTable:getStageNode(id)
	return self:getNumber(id, "stage_node")
end

function TrialNodeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return TrialNodeTable
