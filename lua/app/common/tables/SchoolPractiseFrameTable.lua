-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SchoolPractiseFrameTable.lua

local SchoolPractiseFrameTable = class("SchoolPractiseFrameTable", import(".BaseTable"))

function SchoolPractiseFrameTable:ctor()
	SchoolPractiseFrameTable.super.ctor(self, "school_practise_frame")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SchoolPractiseFrameTable:getIds()
	return self.ids_
end

function SchoolPractiseFrameTable:getFortid(id)
	return self:getNumber(id, "fort_id")
end

function SchoolPractiseFrameTable:getAward(id)
	return self:split2num(id, "award", "#")
end

return SchoolPractiseFrameTable
