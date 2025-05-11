-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialStageSeaTable.lua

local NewTrialStageSeaTable = class("NewTrialStageSeaTable", import("app.common.tables.BaseTable"))

function NewTrialStageSeaTable:ctor()
	NewTrialStageSeaTable.super.ctor(self, "new_trial_stage_sea")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function NewTrialStageSeaTable:getIds()
	return self.ids_
end

function NewTrialStageSeaTable:getType(id)
	return self:getNumber(id, "type")
end

function NewTrialStageSeaTable:getRewards(id)
	return self:split2Cost(id, "rewards", "|#")
end

function NewTrialStageSeaTable:getBossIds(id)
	return self:split2num(self.ids_[#self.ids_], "boss_id", "|")
end

function NewTrialStageSeaTable:getBuffIDs(id)
	return self:split2Cost(id, "buff_id", "|")
end

return NewTrialStageSeaTable
