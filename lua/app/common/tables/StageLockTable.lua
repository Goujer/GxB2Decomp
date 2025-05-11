-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StageLockTable.lua

local StageLockTable = class("StageLockTable", import("app.common.tables.BaseTable"))

function StageLockTable:ctor()
	StageLockTable.super.ctor(self, "stage_lock")

	self.datas_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.datas_[id] = {}

		local fort_id = row[colIndexTable.fort_id]

		for key, _ in pairs(colIndexTable) do
			self.datas_[id][key] = row[colIndexTable[key]]
		end

		self.maxId_ = self:Number(id)
	end
end

function StageLockTable:getData(id)
	return self.datas_[id]
end

function StageLockTable:getUnlockNum(id)
	return self:getNumber(id, "unlock")
end

function StageLockTable:getShow(id)
	return self:getNumber(id, "show")
end

function StageLockTable:getShowByUnlock(unlock)
	local i = 1

	while i < self.maxId_ do
		if self:getUnlockNum(i) == self:Number(unlock) then
			return self:getShow(i)
		end

		i = i + 1
	end
end

return StageLockTable
