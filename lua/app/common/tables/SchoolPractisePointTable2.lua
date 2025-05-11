-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SchoolPractisePointTable2.lua

local SchoolPractisePointTable2 = class("SchoolPractisePointTable2", import(".BaseTable"))

function SchoolPractisePointTable2:ctor()
	SchoolPractisePointTable2.super.ctor(self, "school_practise_point_2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SchoolPractisePointTable2:getIds()
	return self.ids_
end

function SchoolPractisePointTable2:getPoint(id)
	return self:getNumber(id, "point")
end

function SchoolPractisePointTable2:getPointText(id)
	return self:getString(id, "point_text")
end

function SchoolPractisePointTable2:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function SchoolPractisePointTable2:getScoreId(score)
	for i in pairs(self.ids_) do
		if score >= self:getPoint(self.ids_[i]) then
			return self.ids_[i]
		end
	end

	return -1
end

return SchoolPractisePointTable2
