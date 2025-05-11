-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallangeNewbuffTextTable.lua

local PartnerChallangeNewbuffTextTable = class("PartnerChallangeNewbuffTextTable", import("app.common.tables.BaseTable"))

function PartnerChallangeNewbuffTextTable:ctor()
	PartnerChallangeNewbuffTextTable.super.ctor(self, "partner_challange_newbuff_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function PartnerChallangeNewbuffTextTable:getIDs()
	return self.ids_
end

function PartnerChallangeNewbuffTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function PartnerChallangeNewbuffTextTable:getName(id)
	return self:getString(id, "name")
end

return PartnerChallangeNewbuffTextTable
