-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExpPetTable.lua

local ExpPetTable = class("ExpPetTable", import("app.common.tables.BaseTable"))

function ExpPetTable:ctor()
	ExpPetTable.super.ctor(self, "exp_pet")

	self.datas_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local petID = row[colIndexTable.pet_id]

		if not self.datas_[petID] then
			self.datas_[petID] = {}
		end

		local lev = row[colIndexTable.lv]

		self.datas_[petID][lev] = id
	end
end

function ExpPetTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

function ExpPetTable:getCostByLev(petID, lev)
	local cost = {}
	local data = self.datas_[petID]

	if data then
		local id = data[lev] or 0

		cost = self:getCost(id)
	end

	return cost
end

function ExpPetTable:getRestore(id)
	return self:split2Cost(id, "restore", "#")
end

return ExpPetTable
