-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterDressMissionTextTable.lua

local TimeCloisterDressMissionTextTable = class("TimeCloisterDressMissionTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterDressMissionTextTable:ctor()
	TimeCloisterDressMissionTextTable.super.ctor(self, "time_cloister_dressmission_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for type, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(type))
	end

	table.sort(self.ids_)
end

function TimeCloisterDressMissionTextTable:getIDs()
	return self.ids_
end

function TimeCloisterDressMissionTextTable:getDesc(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, "desc")

	if not formatStr then
		return id
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return TimeCloisterDressMissionTextTable
