-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterPartnerTable.lua

local TimeCloisterPartnerTable = class("TimeCloisterPartnerTable", import("app.common.tables.BaseTable"))

function TimeCloisterPartnerTable:ctor()
	TimeCloisterPartnerTable.super.ctor(self, "time_cloister_partner")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterPartnerTable:getIDs()
	return self.ids_
end

function TimeCloisterPartnerTable:getLevel(id)
	return self:getNumber(id, "level")
end

function TimeCloisterPartnerTable:getTableId(id)
	return self:getNumber(id, "table_id")
end

function TimeCloisterPartnerTable:getGrade(id)
	return self:getNumber(id, "grade")
end

function TimeCloisterPartnerTable:getAwake(id)
	return self:getNumber(id, "awake")
end

function TimeCloisterPartnerTable:checkLeveltoId(level)
	local checkLevel = level

	if checkLevel == 0 then
		checkLevel = 1
	end

	for i in pairs(self.ids_) do
		if i == #self.ids_ then
			return #self.ids_
		end

		if checkLevel >= self:getLevel(self.ids_[i]) and checkLevel <= self:getLevel(self.ids_[i + 1]) then
			return self.ids_[i]
		end
	end
end

return TimeCloisterPartnerTable
