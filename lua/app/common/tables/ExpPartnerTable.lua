-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExpPartnerTable.lua

local ExpPartnerTable = class("ExpPartnerTable", import("app.common.tables.BaseTable"))

function ExpPartnerTable:ctor()
	ExpPartnerTable.super.ctor(self, "exp_partner")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end
end

function ExpPartnerTable:getIDs()
	return self.ids_
end

function ExpPartnerTable:getCost(id)
	local res = {}
	local str = self:getString(id, "cost")

	if str == nil then
		return res
	end

	local arr = xyd.split(str, "|")

	for key in pairs(arr) do
		local item = xyd.split(arr[key], "#", true)

		res[item[1]] = item[2]
	end

	return res
end

function ExpPartnerTable:getAllExp(id)
	local str = self:getString(id, "all_exp")

	return xyd.split(str, "#", true)[2]
end

function ExpPartnerTable:getAllMoney(id)
	local str = self:getString(id, "all_money")

	return xyd.split(str, "#", true)[2]
end

return ExpPartnerTable
