-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DatesDataTextTable.lua

local DatesDataTextTable = class("DatesDataTextTable", import("app.common.tables.BaseTable"))

function DatesDataTextTable:ctor()
	DatesDataTextTable.super.ctor(self, "appointment_partner_data_text_" .. xyd.Global.lang)

	self.ids_ = {}
end

function DatesDataTextTable:getTitle(id)
	return self:getString(id, "title")
end

function DatesDataTextTable:getText(id)
	return self:getString(id, "text")
end

return DatesDataTextTable
