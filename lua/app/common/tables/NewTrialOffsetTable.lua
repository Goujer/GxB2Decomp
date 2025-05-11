-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialOffsetTable.lua

local NewTrialOffsetTable = class("NewTrialOffsetTable", import("app.common.tables.BaseTable"))

function NewTrialOffsetTable:ctor()
	NewTrialOffsetTable.super.ctor(self, "new_trial_offset")

	self.ids_ = {}
	self.idsByBoss_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local boss_id = self:getBossId(id)

		if not self.idsByBoss_[boss_id] then
			self.idsByBoss_[boss_id] = {}
		end

		table.insert(self.idsByBoss_[boss_id], tonumber(id))
	end

	for _, list in ipairs(self.idsByBoss_) do
		table.sort(list)
	end

	table.sort(self.ids_)
end

function NewTrialOffsetTable:getIds()
	return self.ids_
end

function NewTrialOffsetTable:getType(id)
	return self:getNumber(id, "type")
end

function NewTrialOffsetTable:getOffsetX(id)
	return self:getNumber(id, "offsetX")
end

function NewTrialOffsetTable:getOffsetY(id)
	return self:getNumber(id, "offsetY")
end

function NewTrialOffsetTable:getStage(id)
	return self:getNumber(id, "stage_belong")
end

function NewTrialOffsetTable:getBossId(id)
	return self:getNumber(id, "boss_id")
end

function NewTrialOffsetTable:getIdsByBoss(boss_id)
	dump(self.idsByBoss_, "self.idsByBoss_")
	print("boss_id  ", boss_id)

	return self.idsByBoss_[boss_id]
end

return NewTrialOffsetTable
