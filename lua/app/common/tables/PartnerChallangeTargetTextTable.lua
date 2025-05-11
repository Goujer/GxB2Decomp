-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallangeTargetTextTable.lua

local PartnerChallangeTargetTextTable = class("PartnerChallangeTargetTextTable", import("app.common.tables.BaseTable"))

function PartnerChallangeTargetTextTable:ctor()
	PartnerChallangeTargetTextTable.super.ctor(self, "partner_challange_target_text_" .. tostring(xyd.Global.lang))

	self.nameForDesc = {}

	for id, _ in pairs(self.TableLua.rows) do
		self.nameForDesc[self:getName(tonumber(id))] = self:getDesc(tonumber(id))
	end
end

function PartnerChallangeTargetTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function PartnerChallangeTargetTextTable:getName(id)
	return self:getNumber(id, "name") or 0
end

function PartnerChallangeTargetTextTable:getDescByName(id, ...)
	local str = self.nameForDesc[id]
	local pos = string.find(str, "{1}")

	if not pos then
		return str
	end

	local __args = {
		...
	}
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(str, unpack(newargs))

	return result
end

return PartnerChallangeTargetTextTable
