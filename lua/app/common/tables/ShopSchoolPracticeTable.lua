-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopSchoolPracticeTable.lua

local ShopSchoolPracticeTable = class("ShopSchoolPracticeTable", import("app.common.tables.BaseTable"))

function ShopSchoolPracticeTable:ctor()
	ShopSchoolPracticeTable.super.ctor(self, "shop_school_practise")
end

function ShopSchoolPracticeTable:checkShowChoose(id)
	return self:getNumber(id, "num_choose") == 1
end

return ShopSchoolPracticeTable
