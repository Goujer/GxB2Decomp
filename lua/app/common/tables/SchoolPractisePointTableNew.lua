-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SchoolPractisePointTableNew.lua

local SchoolPractisePointTableNew = class("SchoolPractisePointTableNew", import(".BaseTable"))

function SchoolPractisePointTableNew:ctor()
	SchoolPractisePointTableNew.super.ctor(self, "school_practise_point_new2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SchoolPractisePointTableNew:getIds()
	return self.ids_
end

function SchoolPractisePointTableNew:getPoint(id)
	return self:getNumber(id, "point")
end

function SchoolPractisePointTableNew:getPointText(id)
	return self:getString(id, "point_text")
end

function SchoolPractisePointTableNew:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function SchoolPractisePointTableNew:getScoreId(score)
	for i in pairs(self.ids_) do
		if score >= self:getPoint(self.ids_[i]) then
			return self.ids_[i]
		end
	end

	return -1
end

return SchoolPractisePointTableNew
