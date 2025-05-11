-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExploreFacilityAddTable.lua

local ExploreFacilityAddTable = class("ExploreFacilityAddTable", import(".BaseTable"))

function ExploreFacilityAddTable:ctor()
	ExploreFacilityAddTable.super.ctor(self, "travel_facility_add")
end

function ExploreFacilityAddTable:getOutAdd(buildingID, star)
	return self:getNumber(star, "out_add" .. buildingID)
end

function ExploreFacilityAddTable:getStayAdd(buildingID, star)
	return self:getNumber(star, "stay_add" .. buildingID)
end

return ExploreFacilityAddTable
