-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FortTable.lua

local FortTable = class("FortTable", import("app.common.tables.BaseTable"))

function FortTable:ctor()
	FortTable.super.ctor(self, "fort")

	self.datas_ = {}
	self.fortLvIds_ = {}
	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.datas_[id] = {}

		for key in pairs(colIndexTable) do
			self.datas_[id][key] = row[colIndexTable[key]]
		end

		local lv = row[colIndexTable.lv]

		if not self.fortLvIds_[lv] then
			self.fortLvIds_[lv] = {}
		end

		table.insert(self.fortLvIds_[lv], self:Number(id))
		table.insert(self.ids_, self:Number(id))
	end

	for _, ids in pairs(self.fortLvIds_) do
		table.sort(ids, function(a, b)
			return a < b
		end)
	end
end

function FortTable:getData(id)
	return self.datas_[id]
end

function FortTable:getLvFortIds(lv)
	return self.fortLvIds_[lv]
end

function FortTable:getName(id)
	return xyd.tables.fortTextTable:getName(id)
end

function FortTable:getDesc(id)
	return xyd.tables.fortTextTable:getDesc(id)
end

function FortTable:getFortImgId(id)
	return self:getString(id, "fort_img_id")
end

function FortTable:getIsLast(id)
	return self:getNumber(id, "is_last")
end

function FortTable:getFirstStageId(id)
	return self:getNumber(id, "first_stage_id")
end

function FortTable:getLv(id)
	return self:getNumber(id, "lv")
end

function FortTable:getIDs()
	return self.ids_
end

function FortTable:getLockType(id)
	return self:getNumber(id, "lock_type")
end

function FortTable:getMemoryFortImgId(id)
	return self:getString(id, "memory_fort_img_id")
end

function FortTable:getMemoryFortDesc(id)
	return xyd.tables.fortTextTable:getMemoryFortDesc(id)
end

return FortTable
