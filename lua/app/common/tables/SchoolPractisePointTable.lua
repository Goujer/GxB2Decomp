-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SchoolPractisePointTable.lua

local SchoolPractisePointTable = class("SchoolPractisePointTable", import(".BaseTable"))

function SchoolPractisePointTable:ctor()
	SchoolPractisePointTable.super.ctor(self, "school_practise_point")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SchoolPractisePointTable:getIds()
	return self.ids_
end

function SchoolPractisePointTable:getPoint(id)
	return self:getNumber(id, "point")
end

function SchoolPractisePointTable:getPointText(id)
	return self:getString(id, "point_text")
end

function SchoolPractisePointTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function SchoolPractisePointTable:getScoreId(score)
	for i in pairs(self.ids_) do
		if score >= self:getPoint(self.ids_[i]) then
			return self.ids_[i]
		end
	end

	return -1
end

return SchoolPractisePointTable
