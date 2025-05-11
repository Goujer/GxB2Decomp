-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseAwardTable.lua

local HouseAwardTable = class("HouseAwardTable", import("app.common.tables.BaseTable"))

function HouseAwardTable:ctor()
	HouseAwardTable.super.ctor(self, "house_award")
	self:parseTable(nil, true)
end

function HouseAwardTable:getIDs()
	return self.ids_
end

function HouseAwardTable:comfort(id)
	return self:getNumber(id, "comfort")
end

function HouseAwardTable:award(id)
	return self:split2Cost(id, "award", "|#")
end

function HouseAwardTable:getIdByComfort(curComfort)
	local ids = self.ids_
	local selectID = -1

	for i = #ids, 1, -1 do
		local id = ids[i]
		local comfort_ = self:comfort(id)

		if comfort_ <= curComfort then
			selectID = id

			break
		end
	end

	return selectID
end

return HouseAwardTable
