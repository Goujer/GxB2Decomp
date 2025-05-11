-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialStageTable.lua

local NewTrialStageTable = class("NewTrialBuffTable", import("app.common.tables.BaseTable"))

function NewTrialStageTable:ctor()
	NewTrialStageTable.super.ctor(self, "new_trial_stage")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function NewTrialStageTable:getIds()
	return self.ids_
end

function NewTrialStageTable:getType(id)
	return self:getNumber(id, "type")
end

function NewTrialStageTable:getRewards(id)
	return self:split2Cost(id, "rewards", "|#")
end

function NewTrialStageTable:getBossIds(id)
	return self:split2num(self.ids_[#self.ids_], "boss_id", "|")
end

function NewTrialStageTable:getBuffIDs(id)
	return self:split2Cost(id, "buff_id", "|")
end

return NewTrialStageTable
